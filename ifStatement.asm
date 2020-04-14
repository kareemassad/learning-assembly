; IF STATEMENT
; int i = 1;
; if(i == 5){}

;>> IN ASSEMBLY
; R7 = i

;R7 = 1
MOV R7, #1
;Compare R7=1 to 5
CMP R7, #5
BNE DoneIf
;IF BODY GOES HERE
DoneIf