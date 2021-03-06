//hdl module to demonstrate use of task 
//in verilog.

module verilog_task (output reg [15:0] ab_and, ab_or, ab_xor,
                    input wire [15:0] a, b
    
);

always @(a) begin
    bitwise_operation(ab_and, ab_or, ab_xor, a, b);
end

always @(b) begin
    bitwise_operation(ab_and, ab_or, ab_xor, a, b);
end
/*
task bitwise_operation(output [15:0] ab_and, ab_or, ab_xor, 
                    input [15:0] a, b
);
*/
task automatic bitwise_operation(output [15:0] ab_and, ab_or, ab_xor, 
                    input [15:0] a, b
);
//to use the re-entrant behavior

begin
ab_and= a&b;
ab_or= a|b;
ab_xor= a^b;
end
endtask

endmodule //verilog_task