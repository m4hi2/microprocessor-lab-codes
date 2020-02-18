.MODEL SMALL
.STACK 100H
.DATA
MSG DW 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
C DW 10
R DW 0

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 10
    
    LEA SI, MSG 
    MOV AX, 0
    SUM:  
    MOV DX, [SI]
    ADD AX, DX
    INC SI
    INC SI
    LOOP SUM
    
    MOV BX, AX
    
    TO_DECIMAL:
    MOV DX, 0
    MOV AX, BX
    DIV C
    INC R    
    PUSH DX  
    MOV BX, AX
    CMP AX, 0
    JE COUNTER 
    JNE TO_DECIMAL
    
    COUNTER:
    MOV CX, R
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    POP_FUNC:
    POP DX
    ADD DL, 30H
    MOV AH, 2 
    INT 21H
    DEC R
    CMP R, 0
    JNE POP_FUNC
    
    MOV AH, 4CH
    INT 21H
    
    
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN