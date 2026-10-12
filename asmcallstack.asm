;asmcallstack
;Author: Mariano Soares

;set vars (85.125 = 42AA4000)
LDA #$00
STA $0200

LDA #$40
STA $0201

LDA #$AA
STA $0202

LDA #$42
STA $0203

;load pointers to point at float
;you can change these
LDA #$00
STA $10
LDA #$02
STA $11
LDX #$00    

;call sub
JSR shiftexp

;return answers
LDA $0210

BRK

shiftexp:

LDY #$03
LDA ($10),Y    ;goes to third byte, since we set y to 3. ex $10 is 00 (and 11 is 02) and this loads 0200 then its 0203
AND #$7F       ;add 127 drop minus
STA $12        ;stash

;load last bit nto carry
DEY
LDA ($10),y ; last bit lives at 0202 so we dec y and bring it there
ASL ; push into carry

LDA $12        ;load byte again
ROL            ;shift with carry in rightmost

SEC;set carry for subtraction
SBC #$7F;reset number from 127 addition (we are subtracting it now)
STA $0210,X    ;stores from user input

RTS