;;;processes an array to replace every element with its absolute value: 
; for(R11 = 0; R11<Arr_Size; R11++){ ;we'll choose R11 to store array index starting at 0
;     if(Arr[R11]<0){
;         Arr[R11] = abs(Arr[R11]) ;abs() is absolute value func
;     }
; }


; ASSEMBLY
   
   
   
   B    SkipOverVariables

Arr_Size DCD   #5   ; Arr is an array of 5 words
Arr  
   DCD  #3          ; first (0-th) element of Arr
   DCD  #-4
   DCD  #0
   DCD  #-8
   DCD  #6 
    
SkipOverVariables

                      ; for ( R11 = 0; R11 < Arr_size; R11++ )    
                      ; R10 = Arr_Size
   LDR R10, [ Arr_Size ]   
   MOV  R11, #0       ; R11 is index into array, start with index = 0

for_test              ; test whether to enter loop
   CMP  R11, R10
   BGE end_for       ; if fail test, then finished for loop 

                      ; {   ; start of for loop body
                      ; if ( Arr[ R11 ] < 0 )
                      ; for access to Arr: R9 = address of Arr
   MOV  R9, Arr
   LDR  R5, [ R9 , R11 ]     ; R5 = Arr[ R11 ]
   CMP  R5, #0
   BGE end_if   
   
                      ;   {  Arr[ R11 ] = abs( Arr[ R11 ] )     ; abs() is absolute value  
                      ; need value 0 for calculating abs
   MOV  R6, #0        ; R6 = 0
   SUB  R5, R6, R5    ; initial value in R5 is negative: R5 = 0 - R5 = abs( R5 )
   STR  R5 , [R9, R11]      ; store Arr[ R11 ]
                      ;   }
end_if

                      ; }    ; end of for loop body
                      ; adjust Arr index
   ADD   R11, R11, #1
   B  for_test

end_for
   DCD  #0xFFFFFFFF   ; breakpoint instruction