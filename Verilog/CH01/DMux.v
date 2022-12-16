`include "Mux.v"

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
