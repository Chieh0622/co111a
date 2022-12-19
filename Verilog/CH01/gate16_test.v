`include "gate16.v"

module main;
    reg [15:0] a, b;
    wire [15:0] nota, andab, orab;

    Not16 g0(a, nota);
    And16 g1(a, b, andab);
    Or16  g2(a, b, orab);

    initial 
    begin
        $display("        a        |         b        |        Not       |       And        |        Or");
        $monitor("%b | %b | %b | %b | %b", a, b, nota, andab, orab);
        a = 16'b10010101;
        b = 16'b10111010;
        $finish(0);
    end
endmodule