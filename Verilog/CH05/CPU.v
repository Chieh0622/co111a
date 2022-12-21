`include "Memory.v"

module CPU (in, instruction, clk, reset, outM, writeM, addressM, pc);
    input [15:0] in, instruction;
    input clk, reset;
    output [15:0] outM;
    output writeM;
    output [14:0] addressM, pc;
    wire[15:0] outALU, outam, outregisterA, outregisterD, ina, outpc;

    Register A(ina, clk, loada, outregisterA);
    assign addressM = outregisterA[14:0];

    Register D(outALU, clk, loadd, outregisterD);

    ALU   g00(outregisterD, outam, instruction[11], instruction[10], instruction[9], instruction[8], instruction[7], instruction[6], outALU, zr, ng);
    And16 g01(outALU, outALU, outM);

    Mux16 g02(outALU, instruction, insta, ina);
    Mux16 g03(outregisterA, in, amtoalu, outam);

    PC    g04(outregisterA, clk, loadpc, 1'h1, reset, outpc);
    assign pc = outpc[14:0];

    Not   g05(instruction[15], insta);

    And   g06(instc, instruction[5], desta);
    Or    g07(insta, desta, loada);

    Not   g08(insta, instc);

    Or    g09(zr, ng, outzr);
    Not   g10(outzr, post);
    And   g11(instruction[0], post, jgt);

    And   g12(instruction[1], zr, jeq);

    And   g13(instruction[2], ng, jlt);

    Or    g14(jgt, jeq, jge);
    Or    g15(jlt, jgt, jne);
    Or    g16(jeg, jlt, jle);
    Or    g17(jgt, jle, jmp);

    Or    g18(jlt, jeq, j1);
    Or    g19(jlt, j1, j2);
    Or    g20(jge, j2, j3);
    Or    g21(jne, j3, j4);
    Or    g22(jle, j4, j5);
    Or    g23(jmp, j5, j6);

    And   g24(instc, j6, loadpc);
    And   g25(instc, instruction[12], amtoalu);
    And   g26(instc, instruction[3], loadam);
    And   g27(instc, instruction[3], writeM);    
endmodule