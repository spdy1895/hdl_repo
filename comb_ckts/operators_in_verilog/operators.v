module operators (output reg  [3:0] z,
                    output reg [7:0] y, 
                input [3:0] a,b
    
);

initial 
$display("design debugging");

always @(*) begin
    //arithmetic operators
    z=a+b;
    #1 $display("z = %b",z);

    z=a-b;
    #1 $display("z = %b",z);

    z=a/b;
    #1 $display("z = %b",z);
    
    z=a*b;
    #1 $display("z = %b",z);

    z=a%b;
    #1 $display("z = %b",z);

    z=a**b;
    #1 $display("z = %b",z);

    #1  $display("arithmetic opetators!");




    //logical operators
    
    if ((a==b) && (a==4'b1010))
        #1 $display("logical and executes!");
    
    else if ((a==b) && (a==4'b1010))
        #1 $display("logical or exexutes!");   
    
    else if (a==b)
        #1 $display("!a= %b",!a);

    #1 $display("logical operators!");




    //relational operators

    if (a>b) begin
    z=a;
    #1 $display("a is greater =%b", a);
    end
    
    else begin
    z=b;
    #1 $display("b is greater = %b",b);
    end



    #1 $display("relational operators!");
    



    //equality operators

    if(a==b)
    #1 $display("a equals to b");

    #1  $display("equality opeartors!");



    //bitwise opeartors

    z=~a;
    #1 $display("bitwise not of a z= %b", z);

    z=&a;
    #1 $display("bitwise and of a z= %b", z);

    z=|a;
    #1 $display("bitwise or of a z= %b", z);

    z=^a;
    #1 $display("bitwise xor of a z= %b", z);
    
    #1  $display("bitwise operators!");



    //reduction operator

    z=&b;
    #1 $display("reduction & of b z= %b",z);

    z=|b;
    #1 $display("reduction | of b z= %b", z);

    z=^b;
    #1 $display("reduction ^ of b z= %b", z);    

    #1  $display("reducion operator!");



    //shift operators

    z= a>>2;
    #1 $display("2 bit right shift of a z= %b ", z);

    z= b<<2;
    #1 $display("2 bit left shift of b z= %b", z);

    z=a>>>3;
    #1 $display("3 bit arithmetic right shift of a z= %b", z);

    z=b<<<3;
    #1 $display("3 bit arithmetic left shift of b z= %b", z);

    #1 $display("shift operators!");



    //concatenation operator
    y= {a,b};
    #1 $display("y= %b", y);

    #1 $display("concatenation operation!");



    //conditional operator 

    z= (&a) ? (z==1): (z==0);
    #1 $display("conditional operator z= %b", z);   

    #1 $display("conditional opration!");
end


endmodule //operators