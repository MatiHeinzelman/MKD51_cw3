PUBLIC  _GETADC
PRGSEG  SEGMENT CODE
RSEG    PRGSEG

; unsigned char GETADC(unsigned char nr_kanalu);
_GETADC:

PTIO EQU 8008h  ; Base address of ADC channels
 
mov B,r7
;nextStep:
inc B

;PTIO EQU 8008h
; mov DPTR,#PTIO
; mov A,#0fh
; movx @DPTR,A
; movx A,@DPTR
; jnb ACC.0,X0_ON

	
 mov DPTR,#PTIO
 ;movx A,@DPTR
 mov A,B
 movx @DPTR,A

mov r7,b
ret

; 3. Read the conversion result
 ;   MOVX A, @DPTR       ; Read the result from ADC register
 ;   MOV R7, A           ; Store the result in R7







; Rejestry A, R0-R7
; R7 <- nr_kanalu

; 1. POTn=x;

;    MOV DPTR, #0x8008   ; Base address of ADC channels
;    MOV DPL, R7         ; Load the channel number into DPL
;    CLR A
;    MOVX @DPTR, A       ; Start conversion by writing to the ADC register

; 2. Delay 120us - 120 iterations of loop
    MOV A,0xff
;	MOV R6,0x5
DELAY_LOOP:
    DEC A
	
	JNZ DELAY_LOOP
;	MOV R7,0xff
;	DEC R6

;	JMP nextStep

; 3. Read the conversion result
;    MOVX A, @DPTR       ; Read the result from ADC register
;    MOV R7, A           ; Store the result in R7
    RET
END