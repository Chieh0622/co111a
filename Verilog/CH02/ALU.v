`include "Inc16.v"

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