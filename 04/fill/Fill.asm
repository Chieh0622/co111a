// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//use keyboard control screen color

//int start = screen.open, end = screen.close;
//int screen.color = white;
//while(true)
//{
//    if(KBD.press == true)
//    {
//        for(i = start, i < end, ++i)
//        {
//            screen.color = black;
//        }
//    }
//    else
//    {
//        for(i = start, i < end, ++i)
//        {
//            screen.color = white;
//        }
//    }
//}

@8192
D = A
@END
M = D

(LOOP)
    @SCREEN
    D = A
    @PIX
    M = D

    @i
    M = 0

    @KBD
    D = M

    @WHITE
    D;JEQ      
    @BLACK
    D;JGT

(WHITE)
    @END
    D = M
    @i
    D = D - M
    @LOOP
    D;JEQ

    @PIX
    A = M
    M = 0

    @i
    M = M + 1

    @PIX
    M = M + 1

    @WHITE
    0;JMP

(BLACK)
    @END
    D = M
    @i
    D = D - M
    @LOOP
    D;JEQ   
    
    @PIX
    A = M
    M = -1

    @i
    M = M + 1

    @PIX
    M = M + 1

    @BLACK
    0;JMP