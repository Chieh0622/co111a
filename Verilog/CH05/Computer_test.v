`include "Computer.v"

module main;
    reg reset, clk;

    Computer c(clk, reset);

    integer i;

    initial
    begin
        $readmemb("sum.hack", c.g1.m);
        for (i = 0; i < 32; i=i+1) begin
            // $display("%4x: %x", i, c.rom.m[i]);
            $display("%4x: %b", i, c.g1.m[i]);
        end
        $monitor("%4dns clock=%d pc=%d I=%d A=%d D=%d M=%d", $stime, clk, c.pc, c.I, c.addressM, c.g2.outregisterD, c.outM);
        clk = 0;
        #10 reset=1;
        #30 reset=0;
    end

    always #5 
    begin
        clk = clk + 1;
    end

    initial #1800 $finish(0);
endmodule