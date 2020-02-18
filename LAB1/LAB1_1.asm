; LAB 1
; Problem 1: Write a 8086 Assembly Program to take any single
; key input and display at the begining of the next line



                            
                            
.CODE
PROC MAIN
    MOV AH, 01   ;INPUT FUNCTION
    INT 21H
    
    MOV BL, AL   ;THE INPUT GOES INTO AL AND WE SAVE IT TO BL
    
    MOV AH, 02   ;OUTPUT FUNCTION
    ;WHEN WE OUTPUT USING 02, ANYTHING IN DL IS THE OUTPUT
    MOV DL, 0DH  ;CARRIAGE RETURN 
    INT 21H
    MOV DL, 0AH  ;LINE FEED
    INT 21H
    
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH  ;EXIT
    INT 21H
    MAIN ENDP
END MAIN