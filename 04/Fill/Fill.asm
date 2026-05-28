// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

@i
M=0 // i = 0

(LOOP)
@KBD
D=M // D = RAM[24576]

@WHITE
D;JEQ // D == 0
@BLACK
0;JMP // D != 0

(LOOPCOLOR)
@SCREEN
D=A   // D = 16384
@i
D=D+M   // D = i + SCREEN
@KBD
D=A-D    // D = 24576 - (SCREEN + i)
@END
D;JEQ    // D == 0

@SCREEN
D=A   // D = 16384
@i
D=D+M   // D = i + SCREEN
@addr
M=D // addr = I + SCREEN
@color 
D=M // D = color
@addr
A=M // RAM[I+SCREEN]
M=D // RAM[I+SCREEN] = color

@i
M=M+1 // i = i+1
@LOOPCOLOR
0;JMP

(END)
@i
M=0 // i = 0
@LOOP
0;JMP


(WHITE)
@color
M=0
@LOOPCOLOR
0;JMP

(BLACK)
@color
M=-1
@LOOPCOLOR
0;JMP