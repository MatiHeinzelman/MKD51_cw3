PUBLIC  _GETADC
PRGSEG  SEGMENT CODE
RSEG    PRGSEG

; unsigned char GETADC(unsigned char nr_kanalu);
_GETADC:
; Rejestry A, R0-R7
; R7 <- nr_kanalu

; 1. POTn=x;
    MOV DPTR, #0x8000   ; Base address of ADC channels
    MOV DPL, R7         ; Load the channel number into DPL
    CLR A
    MOVX @DPTR, A       ; Start conversion by writing to the ADC register

; 2. Delay 120us - 120 iterations of loop
    MOV A, #40
DELAY_LOOP:
    DEC A
    JNZ DELAY_LOOP

; 3. Read the conversion result
    MOVX A, @DPTR       ; Read the result from ADC register
    MOV R7, A           ; Store the result in R7
    RET
END