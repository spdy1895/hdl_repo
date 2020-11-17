`timescale 1ns/1ps 
//newspaper vending machine coin acceptor
//using a FSM approach
module NEWSPAPER_VENDING (
    output wire newspaper,
    input wire [1:0] coin,
    input clk, reset 
);

wire [1:0] NEXT_STATE;
reg [1:0] PRES_STATE;

//state encodings
parameter   s0= 2'b00,
            s5= 2'b01,
            s10= 2'b10,
            s15= 2'b11;

//clock the state flip-flops use synchronous reset
always @(posedge clk) begin
    if(reset== 1'b1)
        PRES_STATE<= s0;
    else
        PRES_STATE<= NEXT_STATE;
end

//re-evaluate combinational logic each time
//a coin is put or present state changes.
assign {newspaper, NEXT_STATE}= fsm(coin, PRES_STATE);

//combination logic
function [2:0] fsm(
    input [1:0] fsm_coin, 
    input [1:0] fsm_PRES_STATE
    );
    reg fsm_newspaper;
    reg [1:0] fsm_next_state;

    begin
        case (fsm_PRES_STATE)
            s0: begin
                if(fsm_coin== 2'b10)
                begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s10;
                end
                else if(fsm_coin== 2'b01) begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s5;
                end
                else begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s0;
                end
            end

            s5: begin
                if (fsm_coin== 2'b10) begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s15;
                end
                else if (fsm_coin== 2'b01) begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s10;
                end
                else begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s5;
                end
            end

            s10: begin
                if(fsm_coin== 2'b10) begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s15;
                end
                else if (fsm_coin== 2'b01) begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s15;
                end
                else begin
                    fsm_newspaper= 1'b0;
                    fsm_next_state= s10;
                end
            end

            s15: begin
                fsm_newspaper= 1'b1;
                fsm_next_state= s0;
            end
            default: begin
                fsm_newspaper= 1'b0;
                fsm_next_state= s0;
            end
        endcase
        fsm= {fsm_newspaper, fsm_next_state};
    end
endfunction
 
endmodule //NEWSPAPER_VENDING