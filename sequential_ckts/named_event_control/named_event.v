//module for understanding named event control
module named_event (output reg [3:0] out,
                    input wire [3:0] in1,in2,
                    input wire in0,clk

);
event addition, subtraction;
always @(posedge clk) begin
    if(in0) ->addition;
    else -> subtraction;
end
always @( addition) out<= in1+in2;
always @( subtraction ) out<= in1-in2;
endmodule //named_event
