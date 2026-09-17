LDA #$00
STA $0200

LDA #$00
STA $0201

LDA #$00
STA $0202

LDA #$3F
STA $0203


JSR getMantissa

LDA $0210     ; A = 00
LDA $0211     ; A = 00
LDA $0212     ; A = BF

BRK

getMantissa:

;loop and copy
LDX #$00
LOOP:
LDA $0201,X   ; read source byte
STA $0210,X   ; write it one slot lower in the result
INX
CPX #$03
BNE LOOP

;OR
LDA $0212
ORA #$80
STA $0212

RTS