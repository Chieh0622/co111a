`include "../CH03/gates03.v"

module Memory (in, clk, load, address, out);
    input [15:0] in;
    input clk, load;
    input [14:0] address;
    output [15:0] out;
    wire[15:0] ramout, screenout, kbdout;
    wire orab;

    DMux4Way  g0(load, address[14:13], dmuxa, dmuxb, dmuxc, dmuxd);
    Or        g1(dmuxa, dmuxb, orab);

    RAM16K    g2(in, clk, orab, address[13:0], ramout);
    RAM8K     screen(in, clk, dmuxc, address[12:0], screenout);
    Register  keyboard(16'h0F0F, clk, 1'h0, kbdout);

    Mux4Way16 g3(ramout, ramout, screenout, kbdout, address[14:13], out);
endmodule