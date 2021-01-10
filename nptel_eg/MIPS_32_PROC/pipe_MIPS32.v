`timescale 1ns/1ps 
//pipelined implementation of MIPS 32-bit processor.
//pipelined satges are micro-instructions:
/*
->Stage1: Instruction Fetch (IF)
->Stage2: Instruction Decode (ID)
->Stage3: Execute (EX)
->Stage4: Memeory Operation (MEM)
->Stage5: Write Back (WB)

PC: Program Counter
NPC: New Program Counter
IR: Instruction Register
Imm: Immediate Data Register
LMD: Load Memory Data

*/

module pipe_MIPS32 (
    input wire clk1, clk2                  //two-phase clock
);

reg [31:0] PC, IF_ID_IR, IF_ID_NPC;                                 //stage 1-pipelined flip-flops

reg [31:0] ID_EX_IR, ID_EX_NPC, ID_EX_A, ID_EX_B, ID_EX_Imm;        //stage 2-pipeline flip-flops

reg [2:0] ID_EX_type, EX_MEM_type, MEM_WB_type;                     //flip-flops to determine the type of instruction

reg [31:0] EX_MEM_IR, EX_MEM_ALUOut, EX_MEM_B;                      //satge 3-pipeline flip-flops
reg EX_MEM_cond;

reg [31:0] MEM_WB_IR, MEM_WB_ALUOut, MEM_WB_LMD;                    //stage 4-pipeline flip-flops

reg [31:0] Reg [0:31];                                              //Register bank(32x32)
reg [31:0] Mem [0:1023];                                            //1024 x 32 memory

parameter   ADD= 6'd0,
            SUB= 6'd1,
            AND= 6'd2,
            OR= 6'd3,
            SLT= 6'd4,
            MUL= 6'd5,
            HLT= 6'b11_1111,
            LW= 6'd8,
            SW= 6'd9,
            ADDI= 6'd10,
            SUBI= 6'd11,
            SLTI= 6'd12,
            BNEQZ= 6'd13,
            BEQZ= 6'd14;                                        //OPCODES for instructions

parameter   RR_ALU= 3'b000,
            RM_ALU= 3'b001,
            LOAD= 3'b010,
            STORE= 3'b011,
            BRANCH= 3'b100,
            HALT= 3'b101;                                       //type of instructions

reg HALTED;                                                     //set after HLT instruction is 
                                                                //completed (in WB stage)

reg TAKEN_BRANCH;                                               //required to disable instructions
                                                                // after branch

//pipeline stage-1 
//Instruction Fetch (IF)
always @(posedge clk1) begin
    if(HALTED== 0) begin
        if (((EX_MEM_IR[31:26]== BEQZ) && (EX_MEM_cond== 1)) || 
        ((EX_MEM_IR[31:26]== BNEQZ) && (EX_MEM_cond== 0))) begin
            IF_ID_IR <=          Mem[EX_MEM_ALUOut];
            TAKEN_BRANCH<=      1'b1;
            IF_ID_NPC<=         EX_MEM_ALUOut+1;
            PC<=                EX_MEM_ALUOut+1;
        end
        else begin
            IF_ID_IR<= Mem[PC];
            IF_ID_NPC<= PC+1;
            PC<= PC+1;
        end
    end
end

//pipeline stage-2
//Instruction Decode (ID)
always @(posedge clk2) begin
    if(HALTED== 0) begin
        if(IF_ID_IR[25:21]== 5'b00000) begin
            ID_EX_A<= 0;
        end
        else ID_EX_A<= Reg[IF_ID_IR[25:21]];        //rs
    end
        if(IF_ID_IR[20:16]== 5'b00000) begin
            ID_EX_B<= 0;
        end
        else ID_EX_B<= Reg[IF_ID_IR[20:16]];        //rt

        ID_EX_NPC<= IF_ID_NPC;
        ID_EX_IR<= IF_ID_IR;
        ID_EX_Imm<= {{16{IF_ID_IR[15]}}, {IF_ID_IR[15:0]}};     //sign extention to Immediate register

        case (IF_ID_IR[31:26])
            ADD, SUB, AND, OR, SLT, MUL:    ID_EX_type<= RR_ALU;
            ADDI, SUBI, SLTI:               ID_EX_type<= RM_ALU;
            LW:                             ID_EX_type<= LOAD;
            SW:                             ID_EX_type<= STORE;
            BNEQZ, BEQZ:                    ID_EX_type<= BRANCH;
            HLT:                            ID_EX_type<= HALT;
            default:                        ID_EX_type<= HALT;
        endcase
end

//pipeline stage-3
//Execute (EX)
always @(posedge clk1) begin
    if (HALTED== 0) begin
        EX_MEM_type<= ID_EX_type;
        EX_MEM_IR<= ID_EX_IR;
        TAKEN_BRANCH<= 0;

        case (ID_EX_type)
            RR_ALU: begin
                case (ID_EX_IR[31:26])        //opcode
                    ADD:        EX_MEM_ALUOut<= ID_EX_A + ID_EX_B;
                    SUB:        EX_MEM_ALUOut<= ID_EX_A - ID_EX_B;
                    AND:        EX_MEM_ALUOut<= ID_EX_A & ID_EX_B;
                    OR:         EX_MEM_ALUOut<= ID_EX_A | ID_EX_B;
                    SLT:        EX_MEM_ALUOut<= ID_EX_A < ID_EX_B;
                    MUL:        EX_MEM_ALUOut<= ID_EX_A * ID_EX_B;
                    default:    EX_MEM_ALUOut<= 32'hxxxx_xxxx;
                endcase
            end

            RM_ALU: begin
                case (ID_EX_IR[31:26])      //opcode
                    ADDI:       EX_MEM_ALUOut<= ID_EX_A + ID_EX_Imm;
                    SUBI:       EX_MEM_ALUOut<= ID_EX_A - ID_EX_Imm;
                    SLTI:       EX_MEM_ALUOut<= ID_EX_A < ID_EX_Imm;
                    default:    EX_MEM_ALUOut<= 32'hxxxx_xxxx;
                endcase
            end

            LOAD, STORE: begin
                EX_MEM_ALUOut<= ID_EX_A + ID_EX_Imm;
                EX_MEM_B<=      ID_EX_B;
            end

            BRANCH: begin
                EX_MEM_ALUOut<=     ID_EX_NPC + ID_EX_Imm;
                EX_MEM_cond<=       (ID_EX_A== 0);
            end
        endcase
    end
end

//pipeline stage-4
//Memory(MEM)
always @(posedge clk2) begin
    if(HALTED== 0) begin
        MEM_WB_type<=   EX_MEM_type;
        MEM_WB_IR<=     EX_MEM_IR;

        case (EX_MEM_type)
            RR_ALU, RM_ALU:     MEM_WB_ALUOut<= EX_MEM_ALUOut;
            LOAD:               MEM_WB_LMD<= Mem[EX_MEM_ALUOut];
            STORE:              if (TAKEN_BRANCH== 0) begin     //disable write
                                Mem[EX_MEM_ALUOut]<= EX_MEM_B;
            end
        endcase
    end
end

//pipeline stage-5
//Write Back (WB)
always @(posedge clk1) begin
    if (TAKEN_BRANCH== 0) begin
        case (MEM_WB_type)
            RR_ALU:     Reg[MEM_WB_IR[15:11]]<= MEM_WB_ALUOut;      //rd
            RM_ALU:     Reg[MEM_WB_IR[20:16]]<= MEM_WB_ALUOut;      //rt
            LOAD:       Reg[MEM_WB_IR[20:16]]<= MEM_WB_LMD;         //rt
            HALT:       HALTED<= 1'b1;
        endcase
    end
end

endmodule //pipe_MIPS32