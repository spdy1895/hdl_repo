`timescale 1ns/1ps 
`include "NEWSPAPER_VENDING.v"
module NEWSPAPER_VENDING_tb (
    
);

reg clock;
reg[1:0] coin;
reg reset;
wire newspaper;

//instantiating the vending machine
NEWSPAPER_VENDING n0(newspaper, coin, clock, reset);

initial begin
    clock= 1'b0;
    forever #20 clock= ~clock;
end

initial begin

    $dumpfile("NEWSPAPER_VENDING_tb.vcd");
    $dumpvars(0, NEWSPAPER_VENDING_tb);
    coin= 2'b00;
    reset= 1'b1;
    #50 reset= 1'b0;
    @(negedge clock);
    //wait for the negative edge of the clock

    //put 3 nickles to get newspaper
    #80 coin= 2'b01; #40 coin= 2'b00;
    #80 coin= 2'b01; #40 coin= 2'b00;
    #80 coin= 2'b01; #40 coin= 2'b00;

    //put 1 nickle and 1 dime
    #180 coin= 2'b01; #40 coin= 2'b00;
    #80 coin= 2'b10; #40 coin= 2'b00;

    //put 2 dimes but machine does not return nickle 
    //as change
    #180 coin= 2'b10; #40 coin= 2'b00;
    #80 coin= 2'b10; #40 coin= 2'b00;

    //put one dime and then one nickle
    #180 coin= 2'b10; #40 coin= 2'b00;
    #80 coin= 2'b01; #40 coin= 2'b00;

    #70 $finish;
end

endmodule //NEWSPAPER_VENDING_tb