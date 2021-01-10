//hdl module for demonstrating the behaviour of variables 
module ex2 (output reg c, d, e, f, g, h
);

reg a, b;

initial h= #25 (a|b);

initial #1 d= #25 (a|b);    //this is some sort of scheduled assignment so take values of a and b 
                            //at 1 time units then or them and assign after 25 time units. Meanwhile 
                            //a is changing it's value after 10 time units but this will have no effect
                            //on d.

initial #20 c= (a|b);       //this "regular assignment delay" haults the execution of the entire 
                            //statement and hence a or b executes after 20 time units and the 
                            //values at 20 time units will be considered for the evaluation of c.

initial #1 e<= (a|b);       //same explanation as in case of d, sampled and scheduled assignment
                            //e does not updates it's value if variables changes because it's in 
                            //initial block.

always #1 f<= (a|b);        //both non- blocking and blocking acts similarly in this case.

always #1 g= (a|b);         

initial begin
    a= 1'b1; b= 1'b0;
    #10 a= 1'b0;
end

initial begin
    $dumpfile("ex2.vcd");
    $dumpvars(0, ex2);
    #40 $finish;
end
endmodule //ex2 