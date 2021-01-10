//hdl module for even parity using task
//out high if even parity.
module even_parity (output reg parity,
                    input  wire [15:0] in,
                    input wire clock
);

always @(posedge clock) begin
    repeat(2) @(posedge clock);
    parity= ~cal_parity(in);
end

function cal_parity(
    input [15:0] in
);
  cal_parity= ^in;
    
endfunction
endmodule //even_parity