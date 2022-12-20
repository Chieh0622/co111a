`include "DFF.v"

module Bit (in, clk, load, out);
    input in, load;
    output out;
    wire muxab;

    Mux g0(out, in, load, muxab);
    DFF g1(muxab, clk, out);
endmodule