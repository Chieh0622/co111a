`include "Bit.v"

module main;
    reg in, clk, load;
    wire out;

    Bit g0(in, clk, load, out);

    initial 
    begin
        in = 0;
        clk = 0;
        load = 0;
        $display("  Time | in | clock | load | out");
        $monitor("%4dns |  %b |   %b   |   %b  |  %b", $stime, in, clk, load, out);
    end

    always #50
    begin
        load = load + 1;
    end

    always #100
    begin
        clk = clk + 1;
    end

    always #200
    begin
        in = in + 1;
    end

    initial #750 $finish(0);
endmodule