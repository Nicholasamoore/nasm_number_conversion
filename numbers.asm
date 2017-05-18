;Nicholas Moore
;COSC 2325 NRG 001
;Lab 6 - Number Conversion
; g++ main.cpp -c -o main.o
; nasm numbers.asm -f elf64 -o numbers_def.o
; g++ main.o numbers_def.o -o main
; ./main

	section .data

        bits    64
        global  n_len, n_dtoi, n_btoi

        section .text

;------------begin decimal to unsigned integer conversion---------------

n_dtoi:
	xor	rsi, rsi	;zero out registers
	xor	rax, rax
	xor	rdx, rdx
	xor	rcx, rcx
dtoi_loop:
	mov	dl, [rdi+rsi]	;move current char into dl
	
	cmp	dl, "-"		;compare dl with "-"
	jz	dtoi_next	;ignore '-' if encountered
	cmp	dl, "."		;compare dl with "."
	jz	dtoi_end	;end when "." is encountered
	
	add	rcx, rcx		
	lea	rcx, [rcx+rcx*4];arithmetic with scalar multiplier
	sub	dl, 48		;subtract code for 0	

	movzx	rdx, dl		;move the value with extended 0s
	add	rcx, rdx	;add to result

dtoi_next:
	inc	rsi		;increment for next char
	jmp	dtoi_loop	;loop again

dtoi_end:
	mov	rax, rcx	;move final result to rax
	ret

;-------------end decimal to unsigned integer conversion----------------

n_len:
        xor     rax, rax     	; cheap zero
        xor     rcx, rcx
len_loop:
        mov     dl, [rdi+rax]
        cmp     dl, 0       	; is it a zero byte
        jz      len_done
        inc     rax
        jmp     len_loop
len_done:
        ret

;-------------begin binary to unsigned integer conversion---------------

n_btoi:
	call	n_len		;utilize n_len to retrieve string length
	xor	rsi, rsi	;zero out
	add	rsi, rax	;rsi holds length of string
	xor	rax, rax	;zero out. holds the result
	xor	r8, r8		;zero out. keeps track of bit position
	xor	r11, r11	;zero out. used to loop inside exponent
	mov	r10, 2		;base 2 for exponent multiplication
	
btoi_loop:
	mov	dl, [rdi+rsi-1]	;move current char into dl
	cmp	dl, "_"		;check if dl holds "_"
	jz	btoi_end	;end when "_' is encountered

	sub	dl, 48		;convert char to digit
	cmp	dl, 0		;compare char with 0
	jz	skip		;if char is zero, jump to skip

	mov	r11, r8		;move current bit position into r11
		
exponent:
	cmp	r8, 0		;check if it's the least significant bit
	jz	zeropow		;if it is, jump to zeropow
	
	cmp	r11, 1		;compare loop counter with 1
	jz	ex_done		;if 1, end loop and jump to ex_done
	
	lea	r10, [r10*2]	;arithmetic for 2^n 
	dec	r11		;decrement loop counter
	jmp	exponent	;loop again

zeropow:
	add	rax, 1		;2^0 = add 1 to result
	dec	rsi		;decrement string length

	inc	r8		;increment bit position (from right)
	jmp	btoi_loop	;jump back to main loop

ex_done:
	add	rax, r10	;add the exponential result into rax
	mov	r10, 2		;reset r10 back to 2

	dec	rsi		;decrement string length
	inc	r8		;increment bit position (from right)
	jmp	btoi_loop	;jump back to main loop

skip:
	inc	r8		;increment bit position
	dec	rsi		;decrement sting length
	jmp	btoi_loop	;jump back to main loop

btoi_end:
	ret

;--------------end binary to unsigned integer conversion----------------

