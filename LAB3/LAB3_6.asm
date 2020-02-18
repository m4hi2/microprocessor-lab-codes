;LAB3
;PROBLEM: WRITE AN 8086 ASSEMBLY PROGRAM TO TAKE INPUT ANY DECIMAL
;NUMBER AND DISPLAY IT IN THE NEXT LINE

.MODEL SMALL
.STACK 100H
.DATA
P DW 10
R DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX, 0
    
    INPUT:
    MOV AH, 01
    INT 21H
    CMP AL, 13D
    JNE PROCESS
    JE PRINT
    
    PROCESS:
    SUB AL, 30H 
    MOV CH, 0
    MOV CL, AL
    MOV AX, BX
    MUL P
    ADD AX, CX
    MOV BX, AX
    JMP INPUT
    
    PRINT: 
    MOV DX, 0
    MOV AX, BX
    DIV P
    INC R
    PUSH DX
    MOV BX, AX
    CMP AX, 0
    JE COUNTER
    JNE PRINT
    
    COUNTER: 
    MOV CX, R
    MOV AH, 02
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    POPFUNC:
    POP DX
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    CMP R, 0
    LOOP POPFUNC
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP 
END MAIN