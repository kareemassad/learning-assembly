; This program 

; int size = Arr.Size = 3;
; int Arr[] = {20,-4,0};

; R2 = Arr;
; if(R3 !=0) {
;    for(R3 = Arr_Size-1;R3>=0;R3--){
;       R5 = Arr[R3];
;       R5 += 10;
;       Arr[R3] = R5;
      
;       printf("%i",Arr[R3]);
;    }
; }



   B    SkipOverVariables

   
Arr_Size  DCD #3  ; Arr is an array of 3 words
Arr
   DCD  #20       ; first (0-th) element of Arr = 20
   DCD  #-4       ; second (1-th) element of Arr = -4 
   DCD  #0        ; third (2-th) element of Arr = 0

SkipOverVariables
   MOV  R2, Arr          ; use R2 for address of Arr
   LDR  R3, [ Arr_Size ] ; user R3 for Arr_Size
   CMP  R3, #0           ; 
   BEQ  Done             ;
   SUB  R3, R3, #1       ;

Loop   
   LDR  R5, [R2, R3 ]    ;
   ADD  R5, R5, #10      ;
   STR  R5, [R2, R3]     ;
   SUB  R3, R3, #1       ;
   BPL  Loop             ; last PQ3 comment here

Done
   DCD  #0xFFFFFFFF     ; breakpoint instruction