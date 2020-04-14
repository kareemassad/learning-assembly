; FOR LOOPS in C
; for(int i = 0; i<array.size;i++){}

;>>IN ASSEMBLY
; R7 = i (iterator)
; R5 = arr.size

;sets i = 0
MOV R7, #0 
;A Label that marks loops start
DoFor 
;compare i to arr.size
CMP R7, R5 
;This will exit the loop if the condition is met
BHS DoneFor 
;;;For-loop body goes here
;i++
ADD R7, R7, #1
;branch back to beginning of loop
BAL DoFor
;loop exit
DoneFor