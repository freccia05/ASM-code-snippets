; Subroutine Call and Return
; Indirect Indexed Addressing
LDA #$00
STA $10       ; pointer low byte
LDA #$04
STA $11       ; pointer high byte -> base = $0400

LDY #$00
LDA #$07
STA ($10),Y   ; $indirect index
INY
LDA #$09
STA ($10),Y   ; indirect index with y=1 so 0401

JSR ADD2      ; call the subroutine
STA $20       ; store
BRK 

ADD2:
LDY #$00
LDA ($10),Y   ; set A to first before adding 9
INY
CLC
ADC ($10),Y   ; 7+9 is 16 so $10
RTS
