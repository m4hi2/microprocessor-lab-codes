;LAB_2
;PROBLEM 3: WRITE A PROGRAM TO READ ONE OF THE HEX DIGITS
; A-F AND DISPLAY IT ON THE NEXT LINE IN DECIMAL

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "ENTER A HEX DIGIT: $"
MSG2 DB 0DH, 0AH, "IN DECIMAL: 1"
RESULT DB ?, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 09
    INT 21H
    
    MOV AH, 01
    INT 21H
    
    SUB AL, 11H
    
    MOV RESULT, AL
    
    LEA DX, MSG2
    MOV AH, 09
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN