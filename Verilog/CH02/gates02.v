`include "../CH01/gates01.v"

module HalfAdder (a, b, sum, carry);
    input a, b;
    output sum, carry;

    Xor g0(a, b, sum);
    And g1(a, b, carry);
endmodule

module FullAdder (a, b, c, sum, carry);
    input a, b, c;
    output sum, carry;
    wire xab, and1, and2;
    
    Xor g0(a, b, xab);
    Xor g1(xab, c, sum);

    And g2(c, xab, and1);
    And g3(a, b, and2);

    Or  g4(and1, and2, carry);
endmodule

module Add16 (a, b, out);
    input [15:0] a, b;
    output [15:0] out;
    wire [15:0] c;
    wire trash;

    HalfAdder g00(a[0], b[0], out[0], c[0]);
    FullAdder g01(a[1], b[1], c[0], out[1], c[1]);
    FullAdder g02(a[2], b[2], c[1], out[2], c[2]);
    FullAdder g03(a[3], b[3], c[2], out[3], c[3]);
    FullAdder g04(a[4], b[4], c[3], out[4], c[4]);
    FullAdder g05(a[5], b[5], c[4], out[5], c[5]);
    FullAdder g06(a[6], b[6], c[5], out[6], c[6]);
    FullAdder g07(a[7], b[7], c[6], out[7], c[7]);
    FullAdder g08(a[8], b[8], c[7], out[8], c[8]);
    FullAdder g09(a[9], b[9], c[8], out[9], c[9]);
    FullAdder g10(a[10], b[10], c[9], out[10], c[10]);
    FullAdder g11(a[11], b[11], c[10], out[11], c[11]);
    FullAdder g12(a[12], b[12], c[11], out[12], c[12]);
    FullAdder g13(a[13], b[13], c[12], out[13], c[13]);
    FullAdder g14(a[14], b[14], c[13], out[14], c[14]);
    FullAdder g15(a[15], b[15], c[14], out[15], trash);
endmodule

module Inc16(input[0:15] in, output[0:15] out);
  Add16 g1(in, 16'h1, out);
endmodule

module ALU (x, y, zx, nx, zy, ny, f, no, out, zr, ng);
    input [15:0] x, y;
    input zx, nx, zy, ny, f, no;
    output [15:0] out;
    output zr, ng;
    wire[15:0] muxzx, notzx, muxnx, muxzy, notzy, muxny, andxy, addxy, muxf, notf, muxout;
    wire or81, or82, orab;

    // zx, zy
    Mux16 g0(x,  16'b0, zx, muxzx);
    Mux16 g1(y,  16'b0, zy, muxzy); 

    // nx, ny
    Not16 g2(muxzx, notzx);
    Not16 g3(muxzy, notzy);
    Mux16 g4(muxzx, notzx, nx, muxnx);   
    Mux16 g5(muxzy, notzy, ny, muxny); 

    // f
    And16 g6(muxnx, muxny, andxy);
    Add16 g7(muxnx, muxny, addxy);       
    Mux16 g8(andxy, addxy, f, muxf);

    // no
    Not16 g09(muxf, notf);
    Mux16 g10(muxf, notf, no, muxout);  
    And16 g11(muxout, muxout, out); 

    // zr, ng
    Or8Way g12(out[7:0],  or81);  
    Or8Way g13(out[15:8], or82);

    Or    g14(or81, or82, orab); 
    Not   g15(orab, zr);            
    And   g16(muxout[15], muxout[15], ng);  

    And16 g17(muxout, muxout, out);
endmodule