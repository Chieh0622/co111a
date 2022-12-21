`include "Add16.v"

module main;
reg  [15:0] a,b;
wire [15:0] out;

Add16 g0(a, b, out);

initial
    begin
        $display("        a        |        b         |       Add16");
        $monitor("%b | %b | %b", a, b, out);
        a = 16'b1101000110;
        b = 16'b0011101001;
        $finish(0);
    end

endmodule