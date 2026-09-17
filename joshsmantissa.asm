;Author: Joshua Fouch
;get mantisaa 6502 code

;load the 4 bytes in little endian
LDA #$00
STA $0200
LDA #$00
STA $0201
LDA #$80
STA $0202
LDA #$3F
STA $0203

;call the subroutine
JSR GET_MANTISSA
;load them into accumulator
LDA $0210
LDA $0211
LDA $0212
BRK

GET_MANTISSA:
; load the first 3 bytes
LDA $0200
STA $0210

LDA $0201
STA $0211

LDA $0202
AND #$7F ;shift to take out the left-most bit
ORA #$80 ;add a 1 to the front
STA $0212
RTS