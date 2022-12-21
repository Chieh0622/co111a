`include "Register.v"

module main;
    reg [15:0] in;
    reg clk, load;
    wire [15:0] out;

    Register g0(in, clk, load, out);

    initial
    begin
        $display("  Time |        in        | clock | load |       out");
        $monitor("%4dns | %b |   %b   |   %b  | %b", $stime, in, clk, load, out);
        in = 0;
        clk = 0;
        load = 0;
    end

    always #1
    begin
        load = load + 1;
    end

    always #2
    begin
        clk = clk + 1;
    end

    always #3
    begin
        in =  in + 1;
    end

    initial #50 $finish(0);
endmodule