;TestNWord.asm
;Author: Mariano Soares
*=$0600

LDA #$01        ; N = 1
PHA
LDA #>Q1        ; Q high
PHA
LDA #<Q1        ; Q low
PHA
LDA #>R1        ; R high
PHA
LDA #<R1        ; R low
PHA
JSR subNWord
PHP             ;capture flags if you want to inspect them
PLA 
STA $30
PLA   
PLA 

; ---- Test 2: $03C3 - $01C3 (2 bytes) ----
LDA #$02        ; N = 2
PHA
LDA #>Q2        ; Q high
PHA
LDA #<Q2        ; Q low
PHA
LDA #>R2        ; R high
PHA
LDA #<R2        ; R low
PHA
JSR subNWord
PHP
PLA
STA $31         ; flags from test 2
PLA
PLA

; ---- Test 3: $00006301 - $FFFFD824 (4 bytes) ----
LDA #$04        ; N = 4
PHA
LDA #>Q3        ; Q high
PHA
LDA #<Q3        ; Q low
PHA
LDA #>R3        ; R high
PHA
LDA #<R3        ; R low
PHA
JSR subNWord
PHP
PLA
STA $32         ; flags from test 3
PLA
PLA
BRK

; Test data, little-endian (low byte first)
Q1      !byte $E4
R1      !byte $F0
Q2      !byte $C3, $03
R2      !byte $C3, $01
Q3      !byte $01, $63, $00, $00
R3      !byte $24, $D8, $FF, $FF

!src "SubNWord.asm"