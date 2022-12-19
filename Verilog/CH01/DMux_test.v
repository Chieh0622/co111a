`include "DMux.v"

module  main;
    reg in;
    reg [2:0] sel;
    wire a4, b4, c4, d4, a8, b8, c8, d8, e8, f8, g8, h8;

    DMux4Way g0(in, sel[1:0], a4, b4, c4, d4);
    DMux8Way g1(in, sel[2:0], a8, b8, c8, d8, e8, f8, g8, h8);

    initial
    begin
        $display("  Time |  intput   |         DMux4         |                     DMux8 ");
        $display("       | in  | sel | D4a | D4b | D4c | D4d | D8a | D8b | D8c | D8d | D8e | D8f | D8g | D8h");
        $monitor("%4dns |  %b  |  %x  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b", $stime, in, sel, a4, b4, c4, d4, a8, b8, c8, d8, e8, f8, g8, h8);
        in =0;
        sel = 0;
    end

    always #50
    begin
        sel++; 
    end

    always #200
    begin
        in = 1;
    end

    initial #501 $finish;
endmodule