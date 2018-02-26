.data
tower1: .word
disc:   .word 3
.text
# s1 towers.
#if we add 32 in decimal we move to the other tower
main:
	la $s1, tower1
	jal fill
	la $s0, disc
	lw $a0,($s0)
	addi $a1,$zero,1
	addi $a2,$zero,2
	addi $a3,$zero,3
	jal hanoi
	j exit
	

# fill the tower with the number of discs.
fill:
	la $s2, disc
	lw $s0, ($s2)
	add $t0,$zero,$s1
loop1:	sw $s0, ($t0)
	addi $t0,$t0,4
	addi $s0,$s0,-1
	bne $s0,$zero,loop1
	jr $ra
	
hanoi: # a0 -> n | a1 -> origin | a2 -> aux | a3 -> destination
	#push into stack
	#ra
	#t0,t1,t2,
	#a0,a1,a2
	
	#addi $sp, $sp, -28
	addi $sp, $sp, -32
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $a0, 16($sp)
	sw $a1, 20($sp)
	sw $a2, 24($sp)
	sw $a3, 28($sp)
	
	slti $t0,$a0,2 		#to check id the number of discs is 1
	bne $t0,$zero,base
	#we apply the recursivity
	add $t1,$a2,$zero
	add $a2,$a3,$zero
	add $a3,$t1,$zero
	addi $a0,$a0,-1
	jal hanoi		#a0 ->n | a1 -> origin | a2 -> destination | a3 -> aux
	addi $a0,$a0,+1
	#add $t1,$a2,$zero
	#add $a2,$a3,$zero
	#add $a3,$t1,$zero
	jal moveDisc 		# a0-> n , a1 -> origin, a2 -> destination
	addi $a0,$a0,-1
	add $t1,$a1,$zero
	add $a1,$a3,$zero
	add $t2,$a2,$zero
	add $a2,$t1,$zero
	add $a3,$t2,$zero
	jal hanoi #a0 ->n | a1 -> aux | a2 -> origin | a3 -> destination
	
	#pop stack
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $a0, 16($sp)
	lw $a1, 20($sp)
	lw $a2, 24($sp)
	lw $a3, 28($sp)
	#addi $sp, $sp, 28
	addi $sp,$sp,32
	jr $ra  
base: 	
	#add $t1,$a2,$zero
	add $a2,$a3,$zero
	#add $a3,$t1,$zero
	jal moveDisc 	#a0 -> n, a1-> origin, a2-> destination
	#pop stack
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $a0, 16($sp)
	lw $a1, 20($sp)
	lw $a2, 24($sp)
	lw $a3, 28($sp)
	#addi $sp, $sp, 28
	addi $sp, $sp, 32
	jr $ra
	

moveDisc:# a0-> n , a1 -> origin, a2 -> destination
	#push stack
	# ra,t0,s1,t1
	#a0,a1,a2
	addi $sp, $sp, -28
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $s1, 8($sp)
	sw $t1, 12($sp)
	sw $a0, 16($sp)
	sw $a1, 20($sp)
	sw $a2, 24($sp)
	#########################################
	#origin
	la $s1, tower1
	add $t0,$zero,$s1
	addi $t0,$t0,-32#check this line
loop2:	addi $a1,$a1,-1
	addi $t0,$t0,32
	bne $a1,$zero,loop2
	addi $t0,$t0,-4
	#origin we erase
loop4:  addi $t0,$t0,+4
	lw $t1,($t0)
	bne $t1,$a0,loop4
	sw $zero,($t0)
	#########################################
	#destination
	add $t0,$zero,$s1
	addi $t0,$t0,-32#check this line
loop3:	
	addi $a2,$a2,-1
	addi $t0,$t0,32
	bne $a2,$zero,loop3
	addi $t0,$t0,-4
	#destination we place the disc in the tower
loop5:  addi $t0,$t0,+4
	lw $t1,($t0)
	bne $t1,$zero,loop5
	sw $a0,($t0)
	
	#pop stack
	
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $s1, 8($sp)
	lw $t1, 12($sp)
	lw $a0, 16($sp)
	lw $a1, 20($sp)
	lw $a2, 24($sp)
	addi $sp, $sp, 28
	jr $ra
	
exit:
	
	
	
	



	

