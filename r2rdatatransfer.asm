; r2r Data Transfer
; Immediate Addressing
LDA #$7E      ; immediate set A
TAX           ; set X to A
INX           ; add 1 to X
TXA           ; return to A

; now A is $7f