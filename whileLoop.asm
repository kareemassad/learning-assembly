; WHILE LOOP
; int i = 0;
; while(i < arraysize){
;    i++;
;}

; >> IN ASSEMBLY
;R7 = i;
;R5 = array size;

MOV R7, #0
DoWhile
CMP R7, R5
BHS EndWHile
;WHile loop body here
ADD R7, R7, #1
BAL DoWhile
EndWHile