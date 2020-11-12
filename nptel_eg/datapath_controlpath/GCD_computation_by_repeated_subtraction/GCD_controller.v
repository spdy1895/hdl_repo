`timescale 1ns/1ps 
module GCD_controller (
    output reg LdA, LdB, sel1, sel2, sel_in, done,
    input wire lt, gt, eq, start, clk 
);

reg [2:0] state;
parameter   s0= 3'b000,
            s1= 3'b001,
            s2= 3'b010,
            s3= 3'b011,
            s4= 3'b100,
            s5= 3'b101;

always @(posedge clk) begin
    case (state)
        s0: if(start) state<= s1;
        s1: state<= s2;
        s2: begin
            if (eq) state<= s5;
            else if(lt) state<= s3;
            else if(gt) state<= s4; 
        end 
        s3: begin
            if(eq) state<= s5;
            else if(lt) state<= s3;
            else if(gt) state<= s4;
        end
        s4: begin
            if(eq) state<= s5;
            else if(lt) state<= s3;
            else if(gt) state<= s4;
        end
        s5: state<= s5;
        default: state<= s0;
    endcase
end

always @(state) begin
    case (state)
        s0: {LdA, LdB, sel1, sel2, sel_in, done}=6'b100010;
        s1: {LdA, LdB, sel1, sel2, sel_in, done}=6'b010010;
        s2: begin
            if(eq) {LdA, LdB, sel1, sel2, sel_in, done}=6'b000001;
            else if(lt) {LdA, LdB, sel1, sel2, sel_in, done}=6'b011000;
            else if(gt) {LdA, LdB, sel1, sel2, sel_in, done}=6'b100100;
        end
        s3: begin
            if(eq) {LdA, LdB, sel1, sel2, sel_in, done}=6'b000001;
            else if(lt) {LdA, LdB, sel1, sel2, sel_in, done}=6'b011000;
            else if(gt) {LdA, LdB, sel1, sel2, sel_in, done}=6'b100100;
        end
        s4: begin
            if(eq) {LdA, LdB, sel1, sel2, sel_in, done}=6'b000001;
            else if(lt) {LdA, LdB, sel1, sel2, sel_in, done}=6'b011000;
            else if(gt) {LdA, LdB, sel1, sel2, sel_in, done}=6'b100100;
        end
        s5: {LdA, LdB, sel1, sel2, sel_in, done}=6'b000001;

        default: {LdA, LdB, sel1, sel2, sel_in, done}=6'b000000;
    endcase
end

endmodule //GCD_controller