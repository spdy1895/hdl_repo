//hdl module for parity calculation using 
//functions.
module parity_functions (output reg parity,
                        input wire [15:0] in
    
);

always @(in) begin
    parity= parity_gen(in);
end

function parity_gen(
    input [15:0] in
);
begin
    parity_gen= ^in;    
    //to calculate bitwise xor
end
endfunction

endmodule //parity_functions