`timescale 1ns/1ps 
module BOOTH_controller (
    output reg LdA, clrA, sftA, LdQ, clrQ, sftQ, sftDff,
    LdM, clrff, add_sub, EnableALU, decr, LdCount, done,
    input wire clk, q0, qm1, start, eqz    
);

reg [2:0] state;
parameter   S0= 3'b000,
            S1= 3'b001,
            S2= 3'b010,
            S3= 3'b011,
            S4= 3'b100,
            S5= 3'b101,
            S6= 3'b110,
            S7= 3'b111;

always @(posedge clk) begin
    case (state)
        S0: if(start) state<= S1;
        S1: state<= S2;
        S2: begin @(posedge clk)
            if({q0, qm1}== 2'b01) state<= S3;
            else if({q0, qm1}== 2'b10) state<= S4;
            else state<= S5;
        end
        S3: state<= S5;
        S4: state<= S5;
        S5: state<= S7;
        S7: begin
            if(({q0, qm1}== 2'b01) && !eqz) state<= S3;
            else if(({q0, qm1}== 2'b10) && !eqz) state<= S4;
            else if(eqz) state<= S6; 
            else state<= S5;
        end
        S6: state<= S6;
        default: state<= S0;
    endcase
end

always @(state) begin
    case (state)
        S0: begin
            {LdA, clrA, sftA}= 3'b000; {LdQ, clrQ, sftQ}= 3'b000; {LdM, clrff, sftDff, done}= 4'b0000; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0000;
        end
        S1: begin
            {LdA, clrA, sftA}= 3'b010; {LdQ, clrQ, sftQ}= 3'b010; {LdM, clrff, sftDff, done}= 4'b1100; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0000;
        end
        S2: begin
            {LdA, clrA, sftA}= 3'b000; {LdQ, clrQ, sftQ}= 3'b100; {LdM, clrff, sftDff, done}= 4'b0000; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0010;
        end
        S3: begin
            {LdA, clrA, sftA}= 3'b100; {LdQ, clrQ, sftQ}= 3'b000; {LdM, clrff, sftDff, done}= 4'b0000; 
            {add_sub, EnableALU, LdCount, decr}= 4'b1100;
        end
        S4: begin
            {LdA, clrA, sftA}= 3'b100; {LdQ, clrQ, sftQ}= 3'b000; {LdM, clrff, sftDff, done}= 4'b0000; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0100;
        end
        S5: begin
            {LdA, clrA, sftA}= 3'b001; {LdQ, clrQ, sftQ}= 3'b001; {LdM, clrff, sftDff, done}= 4'b0010; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0001;
        end
        S7: begin
            {LdA, clrA, sftA}= 3'b000; {LdQ, clrQ, sftQ}= 3'b000; {LdM, clrff, sftDff, done}= 4'b0000; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0000;
        end
        S6: begin
            {LdA, clrA, sftA}= 3'b000; {LdQ, clrQ, sftQ}= 3'b000; {LdM, clrff, sftDff, done}= 4'b0001; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0000;
        end
        default: begin
            {LdA, clrA, sftA}= 3'b000; {LdQ, clrQ, sftQ}= 3'b000; {LdM, clrff, sftDff, done}= 4'b0000; 
            {add_sub, EnableALU, LdCount, decr}= 4'b0000;
        end
    endcase
end

endmodule //BOOTH_controller