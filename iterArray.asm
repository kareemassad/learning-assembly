;; This program checks if the arrya is size 0(if so, end program)
;; then add 10 to each element in the array.
;;
;;

; int size = Arr.Size = 3;
; int Arr[] = {20,-4,0};

; for(R3 = arr_size; R3>=0; R3--){
;    Arr[R3] = Arr[R3] + 10
; }



   B    SkipOverVariables

   
Arr_Size  DCD #3  ; Arr is an array of 3 words
Arr
   DCD  #20       ; first (0-th) element of Arr = 20
   DCD  #-4       ; second (1-th) element of Arr = -4 
   DCD  #0        ; third (2-th) element of Arr = 0

SkipOverVariables
   MOV  R2, Arr          ; init R2 as array
   LDR  R3, [ Arr_Size ] ; user R3 for Arr_Size
   CMP  R3, #0           ; Checks that the array isnt empty
   BEQ  Done             ; If empty, end program
   SUB  R3, R3, #1       ; subtract 1 from R3 so that we can do for loop

Loop   
   LDR  R5, [R2, R3 ]    ; R5 is set as arr as position R3
   ADD  R5, R5, #10      ; Add 10 to R5
   STR  R5, [R2, R3]     ; Store R5 into arr at R3
   SUB  R3, R3, #1       ; subtract one from R3 so that we can cover other positions
   BPL  Loop             ; reloop

Done
   DCD  #0xFFFFFFFF     ; breakpoint instruction

;; 21 instructions will be executed (loop runs 3 times, arr_size DCD is not 
;; executed because it's just a declaration)
;; 16 words assembled