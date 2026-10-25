;subNWord
;Author: Mariano Soares
; SubNWord():


; push to stack in this order:
; 1. N
; 2. Q high
; 3. Q low
; 4. R high
; 5. R low

;then you can call subNWord and it will return
;the pointer to the result with low byte first
;and high byte second. I stored the result at 
;where q is. the pointer pints to Qs address

; flags managed and returned correctly.
; I used $10 to $1B for the function, so dont 
; store pointers there either when testing.
*=$0700
subNWord:
    ;-lift and store return address
    PLA
    STA $14
    PLA
    STA $15

    ;lift pointer

    PLA
    STA $12 ; R
    PLA
    STA $13 ; R hish
    PLA
    STA $10 ; Q
    PLA
    STA $11 ; Q high
    PLA
    STA $16 ; N

    ; load address/pointer of return value
    LDA $10
    STA $17
    LDA $11
    STA $18

    LDA #$00 ; load OR operator to restore Z after its changed by X and Y
    STA $1A



    ;subtraction
    LDX $16 ; load x equal to N
    LDY #$00
    SEC
LOOP:
    LDA ($10),Y   ; read 
    SBC ($12),Y   ; subtract R
    PHP
    STA ($17),Y   ; store
    ORA $1A ; saves Z flag status
    STA $1A ; save
    PLA ; restore status from stack after PHP
    STA $19 ; save it to $19
    INY ; increment pointer
    DEX ; while  x > 0, starts at N
    BNE LOOP

    ; this loads the right Z flag status
    LDA $1A         ; load it from where we stored the OR
    PHP             ; store it on stack
    PLA             ; put status' on a (from stack)
    AND #$02        ; keep only the Z bit
    STA $1B         ; save z to 1B

    LDA $19         ; load status from last SBC
    AND #$FD        ; clear Z bit ONLY
    ORA $1B         ; give it correct Z bit
    STA $19 ; final status'

    ; store pointer on stack before leaving
    LDA $18
    PHA
    LDA $17
    PHA



    ;stash return address onto stack
    LDA $15
    PHA 
    LDA $14
    PHA 

    LDA $19
    PHA
    PLP 
    RTS ;and this uses the return address