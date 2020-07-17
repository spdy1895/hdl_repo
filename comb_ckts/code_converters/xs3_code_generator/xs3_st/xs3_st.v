`timescale 1ns/1ps

//excess-3 code converters 
//e0=b0
//e1=b1~^b0
//e2=b2'(b1+b0)+b2b1'b0'
//e3=b3+b2(b0+b1)  

module xs3_st (	output e3,e2,e1,e0,
		input b3,b2,b1,b0
		);
	wire w0,w1,w2,w3,w4,w5,w6,w7;
	
	// getting not of each input
	not (w0,b0);
	not (w1,b1);
	not (w2,b2);

	//defining the structure
	//lsb e0;
	not (e0,b0);

	//e1
	xnor (e1,b1,b0);

	//e2
	or(w4,b0,b1);
	and (w5,w2,w4);
	and (w6,w0,w1,b2);
	or (e2,w5,w6);

	//e3
	and (w7,b2,w4);
	or (e3,b3,w7);

	initial
	$display("debugging complete!");
	
	endmodule
