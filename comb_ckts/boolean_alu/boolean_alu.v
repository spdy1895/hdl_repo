//hdl module to perform basic alu operations using 
//arithmetic operations
module boolean_alu (output reg [4:0] out,
                    input wire [3:0] in1, in2,
                    input wire [2:0] select
    
);

parameter [2:0] cpy_in1=        3'b000,
                add=        3'b001,
                sub=        3'b010,
                div=        3'b011,
                mod=        3'b100,
                shft_lft=  3'b101,
                shft_rht=  3'b110,
                cmp=        3'b111;

reg [3:0] temp1;

always @(*) begin
    case (select)
        cpy_in1: out<= in1;

        add: out<= (in1+in2);

        sub: out<= (in1-in2);

        div: out<= (in1/in2);

        mod: out<= (in1%in2);

        shft_lft: begin 
            temp1= in1;
            out<= temp1<<1;
        end

        shft_rht: begin
            temp1= in1;
            out<= temp1>>1;
        end

        cmp: out<= ((in1>in2) ? 1 : 0);
    endcase
end

endmodule //boolean_alu 