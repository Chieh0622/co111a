`include "gate.v"

module main;
    reg a, b;
    wire Nandab, Nota, Andab, Orab, Xorab;

    Nand g0(a, b, nandab);
    Not  g1(a, nota);
    And  g2(a, b, andab);
    Or   g3(a, b, orab);
    Xor  g4(a, b, xorab);

    initial
    begin
        $display("  Time | a | b | Nand| Not | And | Or | Xor");
        $monitor("%4dns | %1d | %d | %3d | %2d  | %2d  | %2d | %2d",$stime, a, b, nandab, nota, andab, orab, xorab);
        a = 0;
        b = 0;
    end

    always #50 
    begin
        b = b + 1;
    end

    always #100
    begin
        a = a + 1;
    end

    initial #150 $finish(0);
endmodule