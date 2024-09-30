// SAGAR LADLA
// EMBEDDED SYSTEM DESIGN
// ASSIGNMENT 1
// QUESTION 2 CODE

	AREA RESET, CODE, READONLY
	ENTRY
START
	LDR R6, =SRC
	LDR R4, [R6]
	BL PROG
	MOV R5, #0x05 ; COUNT OF DIGITS
	SUB R5, R5, R7 ; R5 - R7 TO CALCULATE LEADING 0s
	ADD R0, R0, R5 ; ADD THE NUMBER OF LEADING 0s TO R0
STOP
	B STOP
PROG
	ADD R7, R7, #0x01 ; DIGIT COUNTER
	
	CMP R4, #0x00
	ADDEQ R0, R0, #0x01
	MOVEQ PC, LR
	
	CMP R4, #0x01
	ADDEQ R1, R1, #0x01
	MOVEQ PC, LR
	
	MOV R2, #0x00
	PUSH {LR}				; SAVING LR CONTEXT
	BL DIV
	CMP R5, #0x01
	ADDEQ R1, R1, #0x01
	CMP R5, #0x00
	ADDEQ R0, R0, #0x01
	POP {LR}				; RESTORING LR CONTEXT
	B PROG
DIV
	SUBS R4, R4, #0x0a
	ADD R2, R2, #0x01
	BPL DIV
	SUB R2, R2, #0x01 ;QUOTIENT
	ADD R5, R4, #0x0a ;REMAINDER
	MOV R4, R2 ; R4 = R2
	BX LR
SRC
	DCD 00123 ; 5 DIGIT ROLL
	END