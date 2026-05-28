// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// sum = 0
@sum
M=0

// i = 1
@i
M=1

// i <= R0 
(LOOP)
@i
D=M // D = i
@R0
D=D-M   // D = i - R0
@END
D;JGT // (I - R0) > 0

// sum = sum + R1
@R1
D=M
@sum
M=D+M

// i = i + 1
@i
M=M+1

@LOOP
0;JMP

(END)
// R2 = SUM
@sum
D=M
@R2
M=D