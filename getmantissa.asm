;Get Mantissa
;Author: Mariano Soares

;set vars

LDA #$00
STA $0200

LDA #$00
STA $0201

LDA #$00
STA $0202

LDA #$3F
STA $0203

;call sub
JSR getMantissa

;return answers
LDA $0210
LDA $0211
LDA $0212

BRK

getMantissa:

;loop and copy
LDX #$00
LOOP:
LDA $0201,X   ; read 
STA $0210,X   ; write
INX
CPX #$03
BNE LOOP

;OR
LDA $0212
ORA #$80
STA $0212

RTS