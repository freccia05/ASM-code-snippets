; Logical
; Absolute Indexed Addressing
LDA #$0F      ; 0000 1111
STA $0300     ; put it in the table
LDA #$33      ; 0011 0011
STA $0301     ; next slot in the table

LDX #$00
LDA $0300,X   ; X=0, so read $0400 -> A = $0F
INX           ; X=1
AND $0300,X   ; make A only where both are 1
; A is 0000 0011 which is 03