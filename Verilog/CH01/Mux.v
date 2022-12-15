module Mux (a, b, sel, out);
    input a, b, sel;
    output out;
    
    Not g0(sel, sel, notsel);
    And g1(a, notsel, A1);
    And g2(b, sel, A2);
    Or  g3(A1, A2, out);
endmodule

module Mux16 (a, b, sel, out);
    input [15:0] a, b; 
    input sel;
    output [15:0] out;

    Mux g00(a[0], b[0], out[0]);
    Mux g01(a[1], b[1], out[1]);
    Mux g02(a[2], b[2], out[2]);
    Mux g03(a[3], b[3], out[3]);
    Mux g04(a[4], b[4], out[4]);
    Mux g05(a[5], b[5], out[5]);
    Mux g06(a[6], b[6], out[6]);
    Mux g07(a[7], b[7], out[7]);
    Mux g08(a[8], b[8], out[8]);
    Mux g09(a[9], b[9], out[9]);
    Mux g10(a[10], b[10], out[10]);
    Mux g11(a[11], b[11], out[11]);
    Mux g12(a[12], b[12], out[12]);
    Mux g13(a[13], b[13], out[13]);
    Mux g14(a[14], b[14], out[14]);
    Mux g15(a[15], b[15], out[15]);
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
    output out;
    wire [15:0] ab, cd, ef, gh, abcd, efgh;

    Mux16 g0(a, b, sel[0], ab);
    Mux16 g1(c, d, sel[0], cd);
    Mux16 g2(e, f, sel[0], ef);
    Mux16 g3(g, h, sel[0], gh);

    Mux16 g4(ab, cd, sel[1], abcd);
    Mux16 g5(ef, gh, sel[1], efgh);

    Mux16 g6(abcd, efgh, sel[2], out);    
endmodule