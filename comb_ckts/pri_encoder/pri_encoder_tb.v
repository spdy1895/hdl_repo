//testbench for priority encoder
`timescale 1ns/1ps

module pri_encoder_tb (
    
);

wire [2:0] OUT;
reg [7:0] IN;

//instantiation
pri_encoder p1(OUT,IN);

initial begin
  $dumpfile("pri_encoder_tb.vcd");
  $dumpvars(0,pri_encoder_tb);

  $monitor($time," input = %b encoded output = %b ",IN,OUT );

    #1 IN= 8'b0000_0001;
    #1 IN= 8'b0000_0010;
    #1 IN= 8'b0000_0100;
    #1 IN= 8'b0000_1000;
    #1 IN= 8'b0001_0000;
    #1 IN= 8'b0010_0000;
    #1 IN= 8'b0100_0000;
    #1 IN= 8'b1000_0000;

end


endmodule //pri_encoder_tb