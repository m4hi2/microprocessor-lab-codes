;2ND 30 EXTRA
;WRITE "1234" IN A NEW LINE, 10 TIMES

.MODEL SMALL
.DATA
MSG DB "1234", 0DH, 0AH, "$"
.CODE
MAIN PROC
    MOV CX, 10
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG
    
    MOV AH, 09
    PRINT:
    INT 21H
    LOOP PRINT
    MAIN ENDP
END MAIN