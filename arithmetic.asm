; Arithmetic
; Absolute Addressing
LDA #$02      ; set number
STA $0310     ; absolute store
LDA #$03      ; set new number
CLC   ; clear carry
ADC $0310     ; add old number

STA $0311    ; store
