#Yara Fernanda Angel Brambila
#Miguel Angel Nuño Hernandez

#Práctica 1: Torres de Hanoi

.data
tower1: .word
disc: 8
.text

main:
	#the towers
	addi $t4,$zero,1
	addi $t5,$zero,2
	ori $s0, 0x10010000
	lw $a0,($s0)
	
	#to erase addi instruction
	addi $s6,$s0,32
	addi $s7,$s0,64
	
fill:	# fill the tower
	add $t0,$zero,$s0
loop1:	sw $a0, ($t0)
	addi $t0,$t0,4
	addi $a0,$a0,-1
	bne $a0,$zero,loop1	
	
	lw $a0,($s0)
	add $s3,$zero,$a0
	addi $a1,$zero,1
	addi $a2,$zero,2
	addi $a3,$zero,3
	jal hanoi
	j exit
	
hanoi: # a0 -> n | a1 -> origin | a2 -> aux | a3 -> destination
	#push into stack	
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	#sw $a3, 16($sp)
	 
	beq $a0,1,base	#to check if the number of discs is 1
	add $t1,$a2,$zero
	add $a2,$a3,$zero
	add $a3,$t1,$zero
	addi $a0,$a0,-1
	jal hanoi		#a0 ->n | a1 -> origin | a2 -> destination | a3 -> aux
	jal moveDisc1 		# a0-> n , a1 -> origin, a2 -> destination
	add $t1,$a1,$zero
	add $a1,$a3,$zero
	add $a3,$a2,$zero
	add $a2,$t1,$zero
	jal hanoi #a0 ->n | a1 -> aux | a2 -> origin | a3 -> destination
	j pop
	
base: 	
	add $a2,$a3,$zero
	jal moveDisc1 	#a0 -> n, a1-> origin, a2-> destination

pop:	#pop stack
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	#lw $a3, 16($sp)
	addi $sp, $sp, 16
	jr $ra	
	
moveDisc1:
	# We start by the saved count of discs, on each tower
	# tower 1 : s3		tower 2 : s4 		tower 3 : s5
	
	#inputs 
	#a0 -> n (disc number we move) 
	#a1 -> origin 
	#a2 -> destination
	
	#first check from wich tower we get the disc
	bne $a1,$t4,tower2	#if (origin == tower 1)
	addi $s3,$s3,-1		#check this line
	sll $s1,$s3,2		#s1 direction 
	add $s1,$s0,$s1
	j exitcase
	
tower2: bne $a1,$t5,tower3	#else if (origin == tower 2)	
	addi $s4,$s4,-1		#check this line
	sll $s1,$s4,2		#s1 direction 
	#add $s1,$s0,$s1
	#addi $s1,$s1,32
	add $s1,$s6,$s1
	j exitcase

tower3: #we do not compare. 	#else -> origin == tower 3
	addi $s5,$s5,-1		#check this line
	sll $s1,$s5,2		#s1 direction 
	#add $s1,$s0,$s1
	#addi $s1,$s1,64
	add $s1,$s7,$s1
	
exitcase:
	lw $s2, 0($s1)		#s2 we got the disc to move
	sw $zero, 0($s1)	#erase the disc from origin
	#now put the disc into destination
	bne $a2,$t4,to2		#if (destination == tower 1)
	sll $s1,$s3,2		#s1 direction we multiply discs by 4
	add $s1,$s0,$s1	
	addi $s3,$s3,1	
	j exitmove
	
to2:	bne $a2,$t5,to3		#if (destination == tower 2)
	sll $s1,$s4,2		#s1 direction we multiply discs by 4
	#add $s1,$s0,$s1
	#addi $s1,$s1,32
	add $s1,$s6,$s1
	addi $s4,$s4,1
	j exitmove

to3:	#we do not compare	#else -> detination == tower 3
	sll $s1,$s5,2		#s1 direction we multiply discs by 4
	#add $s1,$s0,$s1
	#addi $s1,$s1,64	
	add $s1,$s7,$s1
	addi $s5,$s5,1
	
exitmove: 
	sw $s2, 0($s1)		#s2 move to the destionation tower
	jr $ra
	
exit: