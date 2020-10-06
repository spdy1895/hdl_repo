`define TRUE 1'b1
`define FALSE 1'b0
`define Y2R_DELAY 3
`define R2G_DELAY 2

/*
>State Zero: Highway= Green Country= Red
-State One: Highway= Yellow Country= Red
*State Two: Highway= Red Country= Red
@State Three: Highway= Red Country= Green
=State Four: Highway= Red Country= Yellow
*/



module sig_control (output reg [1:0] hwy, cntry,
                    input wire x, clk, clear
    
);

parameter   RED= 2'd0,
            YELLOW= 2'd1,
            GREEN= 2'd2,

            S0= 3'd0, 
            S1= 3'd1,
            S2= 3'd2,
            S3= 3'd3,
            S4= 3'd4;
    
reg [2:0] state, next_state;

always @(posedge clk) begin
    if (clear) state<= S0;
    else state<= next_state;
end

always @(state, x) begin
    case (state)
        S0: next_state<= (x ? S1 : S0);
        S1: begin
            repeat(`Y2R_DELAY) @(posedge clk);
            next_state<= S2;
        end 
        S2: begin
            repeat(`R2G_DELAY) @(posedge clk);
            next_state<= S3;    
        end
        S3: next_state<= (x ? S3 : S4);
        S4: begin
            repeat(`Y2R_DELAY) @(posedge clk);
            next_state<= S0;
        end
        default: next_state<= S0;
        endcase
end

always @(state) begin
    case (state)
        S0: {hwy,cntry}={GREEN, RED};
        S1: {hwy,cntry}={YELLOW, RED};
        S2: {hwy,cntry}={RED, RED};
        S3: {hwy,cntry}={RED, GREEN};
        S4: {hwy,cntry}={RED, YELLOW};
        default: {hwy,cntry}={GREEN, RED};
    endcase
end

endmodule //sig_control
