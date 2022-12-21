`include "Inc16.v"

module main;
    reg[15:0] in;
    wire[15:0] out;

    Inc16 g0(in, out);

    initial 
    begin
        $display("       in        |        out");
        $monitor("%b | %b", in, out);
        in = 16'b100001110011011;
    end
endmodule