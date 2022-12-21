`include "CPU.v"

module Computer (clk, reset);
    input clk, reset;
    wire[15:0] I,out,outM;
    wire[14:0] addressM,pc;

    ROM32K g1(pc,I);
    CPU g2(out, I, clk, reset, outM, writeM, addressM, pc);
    Memory g3(outM, !clk, writeM, addressM, out);
endmodule