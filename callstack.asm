;asmcallstack
;Author: Mariano Soares


; main():

;85.125
LDA #$00
STA $0200
STA $0204
STA $0205
STA $0208
STA $0209
STA $0210
STA $0211
STA $0212
LDA #$40
STA $0201
LDA #$AA
STA $0202
LDA #$42
STA $0203

;8.5
LDA #$28
STA $0206
LDA #$41
STA $0207

;first
LDA #$02
PHA
LDA #$00
PHA
JSR getExponent
;get and store
PLA
STA $0210

;2nd
LDA #$02
PHA
LDA #$04
PHA
JSR getExponent
PLA
STA $0211

;third
LDA #$02
PHA
LDA #$08
PHA
JSR getExponent
PLA
STA $0212

;results
LDA $0210
LDA $0211
LDA $0212
BRK


getExponent:
;-lift and store return address
PLA
STA $14
PLA
STA $15

;lift pointer
PLA
STA $10
PLA
STA $11

;math
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

;subtraction
SEC
SBC #$7F

;stash answer onto stack
PHA            ; the result

;stash return address onto stack
LDA $15
PHA 
LDA $14
PHA 
RTS ;and this uses the return address