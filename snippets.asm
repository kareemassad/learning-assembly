;; ARRAY SEARCH
; R6 = – 1; // initially, the value has not yet been found
; for (R7 = 0; R7 < R5; R7++ ){ // R5 == array size
;   if (array[ R7 ] == R3 ){ // found!
;       R6 = R7; // save index
;       break; // exit loop
;     }
;}

;; >> ASSEMBLY
; R7 = i;
; R6 = desired index;
; R5 = array size
; R3 = Value interesed in
; R4 = Address of start of array

MVN R6, #0
MOV R7, #0
DoFor
CMP R7, R5; R7 < R5
BHS DoneFor; R7 >= R5
LDR R8, [R4, R7]; [R4, R7] = Array[R7], R8 = Array[R7]
CMP R8, R3
BNE EndIf
MOV R6, R7
BAL DoneFor
EndIf
ADD R7, R7, #1
BAL DoFor
DoneFor 

;;11 Words 3 branches.
; WORD = lines that do something
; BRANCHES = labels

;; >>>>>>>>>>>>>> SIMILAR VARIATION
MVN R6, #0 ; R6 = – 1
MVN R7, #0 ; initialize loop R7 = – 1 then inc
IncR7 ADD R7,R7,#1 ; R7++  moved to here!
TestForDone CMP R7, R5 ; R7 < R5?
BGE DoneFor ; No – done!
LDR R8, [R4,R7] ; get element array[R7]
CMP R8, R3 ; element == value of interest?
BNE IncR7 ; No – continue in loop
MOV R6, R7 ; Yes – save index
DoneFor ; continue
;9 WORDS, 2 BRANCHES

STR R6, [R4,#0] ; array[0] = [R6]
LDR R6, [R4, #0] ; R6 = array[0]

;STORE MEANS STORE TO MAIN MEMORY
;LOAD MEANS LOAD FROM MAIN MEMORY
