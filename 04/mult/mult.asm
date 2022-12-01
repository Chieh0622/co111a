// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// R2 = R0 * R1

//    int R2 = 0;
//    if(R0 >= 0)
//    {
//        for(i = R1; i < 0; i--)
//        {
//            R2 = R2 + R0;
//        }
//    }
//    print(R2);

@2
M = 0

@0
D = M
@LOOP
D;JGE

(LOOP)
    @1
    M = M - 1
    D = M
    @END
    D;JLT

    @0
    D = M

    @2
    M = M + D
@LOOP
    0;JMP

(END)
@END
    0;JMP

