module Nand (a, b, out);
    input a, b;
    output out;

    nand g1(out, a, b);    
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
    Not  g1(nandab, nandab, out);
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

    Or g0(in[0], in[1], a1);
    Or g1(in[2], in[3], a2);
    Or g2(in[4], in[5], a3);
    Or g3(in[6], in[7], a4);

    Or g4(a1, a2, b1);
    Or g5(a3, a4, b2);

    Or g6(b1, b2, out);
endmodule