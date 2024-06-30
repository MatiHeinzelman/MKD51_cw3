PUBLIC  _GETADC
PRGSEG  SEGMENT CODE
RSEG    PRGSEG

PTIO EQU 8008h  ; Base address of ADC channels
_GETADC:

	MOV A,r7 ; get param to Accumulator

	; SET DIRECTION FLAG
	CJNE A, #1 , noSetFlag1  ; 
	 mov r0,#1;
	noSetFlag1:
	
	
	CJNE A, #128 , noSetFlag0  ; 
	 mov r0, #0
	noSetFlag0:

	
	
	CJNE r0, #0 , RotateLeft  ; R0is1
	CJNE r0, #1 , RotateRight  ; R0is1

	
	RotateLeft:
	RL A
	jmp afterRorate
	
	RotateRight:
	RR A
	jmp afterRorate
	
	afterRorate:
	
	
	
  


		;PTIO EQU 8008h
		; mov DPTR,#PTIO
		; mov A,#0fh
		; movx @DPTR,A
		; movx A,@DPTR
		; jnb ACC.0,X0_ON

	
 mov DPTR,#PTIO  ; show B on LED
 movx @DPTR,A


mov r7,A  ; mov A to param

JMP _SL33P

ret       ; return with param

; 3. Read the conversion result
 ;   MOVX A, @DPTR       ; Read the result from ADC register
 ;   MOV R7, A           ; Store the result in R7
 
 
PUBLIC  _SL33P
_SL33P:
	MOV R5,#200
	myloopa:
	MOV A,#200
	myloop:
		DEC A
		JNZ myloop
		
		DEC R5
		CJNE R5, #0 , myloopa  ; COMPARE destination, source and jump if not equal


		
	RET

	
END 

 