;LAB_1 
;PROBLEM 2: WRITE A 8086 ASSEMBLY PROGRAM TO CHANGE THE CASE OF 
;A UPPER CASE LETTER TO LOWER CASE

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A UPPER CASE LETTER: $'
MSG2 DB 0DH, 0AH, 'IN LOWER CASE THE LETTER IS: '
CHAR DB ?, '$'

.CODE
MAIN PROC
    ;INITIALIZE DATA SEGMENT
    MOV AX, @DATA   ;GET DATA SEGMENT
    MOV DS, AX      ;PUT THE DATA SEGMENT VALUE INTO DS REGISTER
    
    ;PRINT THE STRING
    LEA DX, MSG1    ;LOADING THE ADDRESS OF MSG1 INTO DX
    MOV AH, 09
    INT 21H
    
    ;TAKING THE INPUT
    MOV AH, 01
    INT 21H
    ADD AL, 20H     ;CONVERTING INTO LOWER CASE
    MOV CHAR, AL    ;SAVING THE VALUE CONVERTED INTO LOWER CASE INTO VARIABLE CHAR
    
    ;DISPLAY ON THE NEXT LINE
    LEA DX, MSG2
    MOV AH, 09
    INT 21H
    
    ;EXIT
    MOV AH, 4CH     ;EXIT PROGRAM FUNCTION
    INT 21H
    MAIN ENDP
END MAIN