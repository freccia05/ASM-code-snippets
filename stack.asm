; Stack
; Absolute Addressing
LDA #$A0      ; store this
STA $0300     
LDA $0300     ; absolute address
PHA           ; push A onto the stack
LDA #$00      ; refresh A to 00
PLA           ; then set it to stack
STA $0301     ; there it is, A=$A0