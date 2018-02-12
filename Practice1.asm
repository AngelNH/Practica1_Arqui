.data
tower1: .word 3 2 1
tower2: .word
tower3: .word

.text
#s0 number of disc
addi $s0,$zero,3

la $a0, tower1

lw $t0, 8($a0)

sw $t0,32($a0)

