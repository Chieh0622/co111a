`include "DFF.v"

module main;
    reg in, clk;
    wire out ;

    DFF g0(in, clk, out);

    initial 
    begin
        $display("  Time | in | clock | out");
        $monitor("%4dns |  %b |   %b   |  %b", $stime, in, clk, out);
        clk = 0;
        in = 0;
    end
    always #50
    begin
        clk = clk + 1;
    end
    always #100
    begin
        in = in + 1;
    end

    initial #350 $finish(0);

endmodule