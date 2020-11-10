//control path for repeated multiplication data path
module MUL_controller (output reg LdA, LdB, LdP,
                         clrP, decB, done,
                        input  wire clk, eqz, start 
);

reg [2:0] state;
parameter   s0= 3'b000,
            s1= 3'b001,
            s2= 3'b010,
            s3= 3'b011,
            s4= 3'b100;

always @(posedge clk) begin
    case(state)
    s0: if(start) state<= s1;
    s1: state<= s2;
    s2: state<= s3;
    s3: if(eqz) state<= s4;
    s4: state<= s4;
    default: state<= s0;
    endcase
end

always @(state) begin
    case (state)
    s0: {LdA, LdB, LdP, clrP, decB, done}<=6'b000000;
    s1: {LdA, LdB, LdP, clrP, decB, done}<=6'b100000;
    s2: {LdA, LdB, LdP, clrP, decB, done}<=6'b010100;
    s3: {LdA, LdB, LdP, clrP, decB, done}<=6'b001010;
    s4: {LdA, LdB, LdP, clrP, decB, done}<=6'b000001;
        default: {LdA, LdB, LdP, clrP, decB, done}<=6'b000000;
    endcase
end

endmodule //MUL_controller