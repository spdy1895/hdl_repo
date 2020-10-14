//hdl module to detect the sequence given by the user
//moore type sequence detector

module seq_det_moore (output reg out,
                        input wire in, rst, clk, 
                        input wire [3:0] sequence
    
);

reg [2:0] pr_state, nxt_state;
reg [3:0] seq;

parameter zero=   3'b000,
          one=    3'b001,
          two=    3'b010,
          three=  3'b011,
          four=   3'b100;

always @( posedge clk ) seq= sequence;

always @( posedge clk ) begin

    if(rst) pr_state = zero;
    
    else  begin
        
        case (pr_state)
        
            zero: begin
                $display("\tpresent state=%b",pr_state);
                nxt_state = ((in=== seq[3]) ? one : zero );
            end

            one: begin
                $display("\tpresent state=%b",pr_state);
                nxt_state = ((in=== seq[2]) ? two : one);
            end

            two: begin
                $display("\tpresent state=%b",pr_state);
                nxt_state = ((in=== seq[1]) ? three : zero);
            end

            three: begin
                $display("\tpresent state=%b",pr_state);
                nxt_state = ((in=== seq[0]) ? four : two);
            end

            four: begin
                $display("\tpresent state=%b",pr_state);
                nxt_state = ((in=== 1'b1) ? one : zero);
            end

            default: begin
                //$display("\tpresent state=%b",pr_state);
                nxt_state = zero;
                end

        endcase

        pr_state <= nxt_state;
    end
    
end

always @( pr_state ) begin
    
    case (pr_state)

        zero: out= 1'b0;
        one: out= 1'b0;
        two: out= 1'b0;
        three: out= 1'b0;
        four: out= 1'b1;
        default: out= 1'b0;

    endcase

    $display("\tnext state=%b \toutput=%b",pr_state, out);

    end

endmodule //seq_det_moore