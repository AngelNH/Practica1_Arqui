.data
tower1: .word
disc:   .word 3
.text
# s1 towers.
#if we add 32 in decimal we move to the other tower
main:
	la $s1, tower1
	j fill

# fill the tower with the number of discs.
fill:
	la $s2, disc
	lw $s0, ($s2)
	add $t0,$zero,$s1
loop1:	sw $s0, ($t0)
	addi $t0,$t0,4
	addi $s0,$s0,-1
	bne $s0,$zero,loop1
	
hanoi: # a0 -> n | a1 -> origin | a2 -> aux | a3 -> destination
	slti $t0,$a0,2 #to check id the number of discs is 1
	bne $t0,$zero,base
	#we apply the recursivity
	add $t1,$a2,$zero
	add $a2,$a3,$zero
	add $a3,$t1,$zero
	addi $a0,$a0,-1
	jal hanoi	#a0 ->n | a1 -> origin | a2 -> destination | a3 -> aux
	addi $a0,$a0,+1
	add $t1,$a2,$zero
	add $a2,$a3,$zero
	add $a3,$t1,$zero
	jal moveDisc # a0-> n , a1 -> origin, a2 -> destination
	addi $a0,$a0,-1
	add $t1,$a1,$zero
	add $a1,$a3,$zero
	add $t2,$a2,$zero
	add $a2,$t1,$zero
	add $a3,$t2,$zero
	jal hanoi #a0 ->n | a1 -> aux | a2 -> origin | a3 -> destination
	jr $ra  
base: 	
	add $t1,$a2,$zero
	add $a2,$a3,$zero
	add $a3,$t1,$zero
	jal moveDisc #n,origin,destination
	jr $ra
	

moveDisc:# a0-> n , a1 -> origin, a2 -> destination
	



	

