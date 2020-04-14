;Assume that the value of |a| will be stored at some memory location 0xXX less that 20 bits.
a value DCD #xxxx ; Assign value of a to a value
MOV R0, #a value ; Move a to R0
MOV R1, #0 ; Value needed fo subtraction
MOV R2, #0xXX ; R2 holds address for storage
CMP R0, #0 ; Check if a ≥ 0
BHS Done ; CMP deals with unsigned values
SUB R0, R1, R0 ; Compute -a if a < 0
Done STR R0, [R2]