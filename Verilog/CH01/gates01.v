module Nand (a, b, out);
    input a, b;
    output out;

    nand g0(out, a, b);
endmodule

module Not (in, out);
    input in;
    output out;

    Nand g0(in, in, out);
endmodule

module And (a, b, out);
    input a, b;
    output out;

    Nand g0(a, b, nandab);
    Not  g1(nandab, out);
endmodule

module Or (a, b, out);
    input a, b;
    output out;

    Nand g0(a, a, nanda);
    Nand g1(b, b, nandb);
    Nand g2(nanda, nandb, out);
endmodule

module Xor (a, b, out);
    input a, b;
    output out;
    
    Nand g0(a, b, nandab);
    Or   g1(a, b, orab);
    And  g2(nandab, orab, out);
endmodule

module  Or8Way(in, out);
    input [7:0] in;
    output out;

    Or g0(in[7], in[6], a1);
    Or g1(in[5], in[4], a2);
    Or g2(in[3], in[2], a3);
    Or g3(in[1], in[0], a4);

    Or g4(a1, a2, b1);
    Or g5(a3, a4, b2);

    Or g6(b1, b2, out);
endmodule

module Not16 (in, out);
    input [15:0] in;
    output [15:0] out;
    
    Not g00(in[0], out[0]);
    Not g01(in[1], out[1]);
    Not g02(in[2], out[2]);
    Not g03(in[3], out[3]);
    Not g04(in[4], out[4]);
    Not g05(in[5], out[5]);
    Not g06(in[6], out[6]);
    Not g07(in[7], out[7]);
    Not g08(in[8], out[8]);
    Not g09(in[9], out[9]);
    Not g10(in[10], out[10]);
    Not g11(in[11], out[11]);
    Not g12(in[12], out[12]);
    Not g13(in[13], out[13]);
    Not g14(in[14], out[14]);
    Not g15(in[15], out[15]);
endmodule

module And16 (a, b, out);
    input [15:0] a, b;
    output [15:0] out;
    
    And g00(a[0], b[0], out[0]);
    And g01(a[1], b[1], out[1]);
    And g02(a[2], b[2], out[2]);
    And g03(a[3], b[3], out[3]);
    And g04(a[4], b[4], out[4]);
    And g05(a[5], b[5], out[5]);
    And g06(a[6], b[6], out[6]);
    And g07(a[7], b[7], out[7]);
    And g08(a[8], b[8], out[8]);
    And g09(a[9], b[9], out[9]);
    And g10(a[10], b[10], out[10]);
    And g11(a[11], b[11], out[11]);
    And g12(a[12], b[12], out[12]);
    And g13(a[13], b[13], out[13]);
    And g14(a[14], b[14], out[14]);
    And g15(a[15], b[15], out[15]);
endmodule

module Or16 (a, b, out);
    input [15:0] a, b;
    output [15:0] out;

    Or g00(a[0], b[0], out[0]);
    Or g01(a[1], b[1], out[1]);
    Or g02(a[2], b[2], out[2]);
    Or g03(a[3], b[3], out[3]);
    Or g04(a[4], b[4], out[4]);
    Or g05(a[5], b[5], out[5]);
    Or g06(a[6], b[6], out[6]);
    Or g07(a[7], b[7], out[7]);
    Or g08(a[8], b[8], out[8]);
    Or g09(a[9], b[9], out[9]);
    Or g10(a[10], b[10], out[10]);
    Or g11(a[11], b[11], out[11]);
    Or g12(a[12], b[12], out[12]);
    Or g13(a[13], b[13], out[13]);
    Or g14(a[14], b[14], out[14]);
    Or g15(a[15], b[15], out[15]);
endmodule

module Mux (a, b, sel, out);
    input a, b, sel;
    output out;
    
    Not g0(sel, notsel);
    And g1(a, notsel, A1);
    And g2(b, sel, A2);
    Or  g3(A1, A2, out);
endmodule

module Mux16 (a, b, sel, out);
    input [15:0] a, b; 
    input sel;
    output [15:0] out;

    Mux g00(a[0], b[0], sel, out[0]);
    Mux g01(a[1], b[1], sel, out[1]);
    Mux g02(a[2], b[2], sel, out[2]);
    Mux g03(a[3], b[3], sel, out[3]);
    Mux g04(a[4], b[4], sel, out[4]);
    Mux g05(a[5], b[5], sel, out[5]);
    Mux g06(a[6], b[6], sel, out[6]);
    Mux g07(a[7], b[7], sel, out[7]);
    Mux g08(a[8], b[8], sel, out[8]);
    Mux g09(a[9], b[9], sel, out[9]);
    Mux g10(a[10], b[10], sel, out[10]);
    Mux g11(a[11], b[11], sel, out[11]);
    Mux g12(a[12], b[12], sel, out[12]);
    Mux g13(a[13], b[13], sel, out[13]);
    Mux g14(a[14], b[14], sel, out[14]);
    Mux g15(a[15], b[15], sel, out[15]);
endmodule

module Mux4Way16 (a, b, c, d, sel, out);
    input [15:0] a, b, c, d;
    input [1:0] sel;
    output [15:0] out;
    wire [15:0] Mux1, Mux2;

    Mux16 g0(a, b, sel[0], Mux1);
    Mux16 g1(c, d, sel[0], Mux2);

    Mux16 g2(Mux1, Mux2, sel[1], out);
endmodule

module Mux8Way16 (a, b, c, d, e, f, g, h, sel, out);
    input [15:0] a, b, c, d, e, f, g, h;
    input [2:0] sel;
    output [15:0] out;
    wire [15:0] ab, cd, ef, gh, abcd, efgh;

    Mux16 g0(a, b, sel[0], ab);
    Mux16 g1(c, d, sel[0], cd);
    Mux16 g2(e, f, sel[0], ef);
    Mux16 g3(g, h, sel[0], gh);

    Mux16 g4(ab, cd, sel[1], abcd);
    Mux16 g5(ef, gh, sel[1], efgh);

    Mux16 g6(abcd, efgh, sel[2], out);    
endmodule

module DMux (in, sel, a, b);
    input in, sel;
    output a, b;

    Not g0(sel, notsel);
    And g1(in, notsel, a);
    And g2(sel, in, b);    
endmodule

module DMux4Way (in, sel, a, b, c, d);
    input in;
    input [1:0] sel;
    output a, b, c, d;
    
    DMux g0(in, sel[1], a0, b0);

    DMux g1(a0, sel[0], a, b);
    DMux g2(b0, sel[0], c, d);
endmodule

module DMux8Way (in, sel, a, b, c, d, e, f, g, h);
    input in;
    input [2:0] sel;
    output a, b, c, d, e, f, g, h;

    DMux g0(in, sel[2], a0, a1);

    DMux g1(a0, sel[1], b0, b1);
    DMux g2(a1, sel[1], b2, b3);

    DMux g3(b0, sel[0], a, b);
    DMux g4(b1, sel[0], c, d);
    DMux g5(b2, sel[0], e, f);
    DMux g6(b3, sel[0], g, h);
endmodule