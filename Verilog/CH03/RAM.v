`include "Register.v"

module RAM8 (in, clk, load, address, out);
    input [15:0] in;
    input clk, load;
    input [2:0] address;
    output [15:0] out;
    wire l0, l1, l2, l3, l4, l5, l6, l7;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    DMux8Way  g0(load, address, l0, l1, l2, l3, l4, l5, l6, l7);
    Register  g1(in, clk, l0, r0);
    Register  g2(in, clk, l1, r1);
    Register  g3(in, clk, l2, r2);
    Register  g4(in, clk, l3, r3);
    Register  g5(in, clk, l4, r4);
    Register  g6(in, clk, l5, r5);
    Register  g7(in, clk, l6, r6);
    Register  g8(in, clk, l7, r7);
    Mux8Way16 g9(r0, r1, r2, r3, r4, r5, r6, r7, address, out);
endmodule

module RAM64 (in, clk, load, address, out);
    input [15:0] in;
    input clk, load;
    input [5:0] address;
    output [15:0] out;
    wire l0, l1, l2, l3, l4, l5, l6, l7;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    DMux8Way  g0(load, address[5:3], l0, l1, l2, l3, l4, l5, l6, l7);
    RAM8      g1(in, clk, l0, address[2:0], r0);
    RAM8      g2(in, clk, l1, address[2:0], r1);
    RAM8      g3(in, clk, l2, address[2:0], r2);
    RAM8      g4(in, clk, l3, address[2:0], r3);
    RAM8      g5(in, clk, l4, address[2:0], r4);
    RAM8      g6(in, clk, l5, address[2:0], r5);
    RAM8      g7(in, clk, l6, address[2:0], r6);
    RAM8      g8(in, clk, l7, address[2:0], r7);
    Mux8Way16 g9(r0, r1, r2, r3, r4, r5, r6, r7, address[5:3], out);
endmodule

module RAM512 (in, clk, load, address, out);
    input [15:0] in;
    input clk, load;
    input [8:0] address;
    output [15:0] out;
    wire l0, l1, l2, l3, l4, l5, l6, l7;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    DMux8Way  g0(load, address[8:6], l0, l1, l2, l3, l4, l5, l6, l7);
    RAM64     g1(in, clk, l0, address[5:0], r0);
    RAM64     g2(in, clk, l1, address[5:0], r1);
    RAM64     g3(in, clk, l2, address[5:0], r2);
    RAM64     g4(in, clk, l3, address[5:0], r3);
    RAM64     g5(in, clk, l4, address[5:0], r4);
    RAM64     g6(in, clk, l5, address[5:0], r5);
    RAM64     g7(in, clk, l6, address[5:0], r6);
    RAM64     g8(in, clk, l7, address[5:0], r7);
    Mux8Way16 g9(r0, r1, r2, r3, r4, r5, r6, r7, address[5:3], out);
endmodule

module RAM4K (in, clk, load, address, out);
    input [15:0] in;
    input clk, load;
    input [11:0] address;
    output [15:0] out;
    wire l0, l1, l2, l3, l4, l5, l6, l7;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    DMux8Way  g0(load, address[11:9], l0, l1, l2, l3, l4, l5, l6, l7);
    RAM512    g1(in, clk, l0, address[8:0], r0);
    RAM512    g2(in, clk, l1, address[8:0], r1);
    RAM512    g3(in, clk, l2, address[8:0], r2);
    RAM512    g4(in, clk, l3, address[8:0], r3);
    RAM512    g5(in, clk, l4, address[8:0], r4);
    RAM512    g6(in, clk, l5, address[8:0], r5);
    RAM512    g7(in, clk, l6, address[8:0], r6);
    RAM512    g8(in, clk, l7, address[8:0], r7);
    Mux8Way16 g9(r0, r1, r2, r3, r4, r5, r6, r7, address[11:9], out);
endmodule

module RAM16K (in, clk, load, address, out);
    input [15:0] in;
    input clk, load;
    input [13:0] address;
    output [15:0] out;
    wire l0, l1, l2, l3;
    wire [15:0] r0, r1, r2, r3;

    DMux4Way  g0(load, address[13:12], l0, l1, l2, l3);
    RAM4K     g1(in, clk, address[11:0], r0);
    RAM4K     g2(in, clk, address[11:0], r1);
    RAM4K     g3(in, clk, address[11:0], r2);
    RAM4K     g4(in, clk, address[11:0], r3);
    Mux4Way16 g5(r0, r1, r2, r3, address[13:12], out)
endmodule