`include "Bit.v"

module Register (in, clk, load, out);
    input [15:0] in;
    input load, clk;
    output out;

    Bit g00(in[0], clk, load, out[0]);
    Bit g01(in[1], clk, load, out[1]);
    Bit g02(in[2], clk, load, out[2]);
    Bit g03(in[3], clk, load, out[3]);
    Bit g04(in[4], clk, load, out[4]);
    Bit g05(in[5], clk, load, out[5]);
    Bit g06(in[6], clk, load, out[6]);
    Bit g07(in[7], clk, load, out[7]);
    Bit g08(in[8], clk, load, out[8]);
    Bit g09(in[9], clk, load, out[9]);
    Bit g10(in[10], clk, load, out[10]);
    Bit g11(in[11], clk, load, out[11]);
    Bit g12(in[12], clk, load, out[12]);
    Bit g13(in[13], clk, load, out[13]);
    Bit g14(in[14], clk, load, out[14]);
    Bit g15(in[15], clk, load, out[15]);
endmodule