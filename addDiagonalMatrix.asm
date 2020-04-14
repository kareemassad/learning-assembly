;Write an assembly code that adds the diagonal entries of A and stores the sum at 0xFFFEDDDC.
;(The sum of diagonal entries is the “Trace of A”.)

We can use the DCD directive to use addresses greater that 20 bits. Otherwise, you can use the parsing
technique outlined in the solution of Homework 6.
Mat Add DCD #0x00112233 ; Assign start address to Mat Add
Mat Size DCD #0x64 ; decimal 100 =0x64
Trace DCD #0xFFFEDDC ; Assign storage address to Trace

MOV R0, #Mat Add ; Initialization: Use R0 to refer to the start address
MOV R1, #0 ; Initialization: Use R1 to offset address
MOV R2, #1 ; Initialization; Use R2 to count elements
MOV R3, #0 ; Initialization: Use R3 to hold sum
MOV R4, #Mat Size ; Initializayion: Use R4 to hold matrix size
ADD R4, R4, #1 ; Initialization: R4=0x65

Loading LDR R5, [R0,R1] ; Use R5 to load the element from MMem

ADD R3, R3, R5 ; Accummulate elements
ADD R2, R2, #1 ; Increment counter
ADD R1, R1, R4 ; Update offset
CMP R2, R4 ; Check if R2=0x65=decimal 101
BLO Loading ; Go to Loading if R2¡101
STR R3, #Trace ; Store sum of diagonal at MMem address 0xFFFEDDC
The above code works to compute the Trace of any matrix. All you need to change the values assigned
to Mat Add, Mat Size and Trace.