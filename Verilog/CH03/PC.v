`include "RAM.v"

module PC (in, clk, load, inc, reset, out);
    input [15:0] in;
    input clk, load, inc, reset;
    output [15:0] out;
    wire [15:0] incout, mux1, mux2, mux3, regout;

    Inc16    g0(regout, incout);
    Mux16    g1(regout, incout, inc, mux1);
    Mux16    g2(mux1, in, load, mux2);
    Mux16    g3(mux2, 16'h0, reset, mux3);
    Register g4(mux3, clk, 1'h1, regout);
    And16    g5(regout, regout, out);
endmodule