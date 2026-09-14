; Branching
; Absolute Indexed Addressing
LDX #$00      ; start the index at 0


LOOP:
LDA #$AA      ; loop A with x and store in new slot
STA $0400,X
INX           ; move to the next slot
CPX #$32     ; see if x is at 32 yet (from 00)
BNE LOOP      ; loop