<<<<<<< HEAD


#Yara Fernanda Angel Brambila

#Miguel Angel Nuño Hernandez



#Práctica 1: Torres de Hanoi





=======
<<<<<<< HEAD
#Yara Fernanda Angel Brambila
#Miguel Angel Nuño Hernandez

#Práctica 1: Torres de Hanoi

.data
tower1: .word
disc: 8
.text

=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
.data

tower1: .word

disc:   .word 8

.text

# s1 towers.

#if we add 32 in decimal we move to the other tower
<<<<<<< HEAD



=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
main:

	#the towers

	addi $t4,$zero,1

	addi $t5,$zero,2
<<<<<<< HEAD



	ori $s0, 0x10010000

	lw $a0,($s0)

	

fill:	# fill the tower

	add $t0,$zero,$s0

loop1:	sw $a0, ($t0)

	addi $t0,$t0,4

	addi $a0,$a0,-1

	bne $a0,$zero,loop1	


=======
<<<<<<< HEAD
	ori $s0, 0x10010000
	lw $a0,($s0)
	
fill:	# fill the tower
	add $t0,$zero,$s0
loop1:	sw $a0, ($t0)
	addi $t0,$t0,4
	addi $a0,$a0,-1
	bne $a0,$zero,loop1	
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	addi $t6,$zero,3

	

	la $s1, tower1

	jal fill

	

	la $s0, disc

	addi $s6,$s0,32

	addi $s7,$s0,64
<<<<<<< HEAD

=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	

	lw $a0,($s0)

	add $s3,$zero,$a0

	addi $a1,$zero,1

	addi $a2,$zero,2

	addi $a3,$zero,3

	jal hanoi

	j exit

	
<<<<<<< HEAD
hanoi: # a0 -> n | a1 -> origin | a2 -> aux | a3 -> destination
	#push into stack	
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $a3, 16($sp)
	 
	beq $a0,1,base	#to check if the number of discs is 1
=======

hanoi: # a0 -> n | a1 -> origin | a2 -> aux | a3 -> destination

	#push into stack	

	addi $sp, $sp, -20

	sw $ra, 0($sp)

	sw $a0, 4($sp)

	sw $a1, 8($sp)

	sw $a2, 12($sp)

	sw $a3, 16($sp)

	 

	beq $a0,1,base	#to check if the number of discs is 1






	

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
<<<<<<< HEAD

=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	add $t1,$a2,$zero

	add $a2,$a3,$zero

	add $a3,$t1,$zero

	addi $a0,$a0,-1

	jal hanoi		#a0 ->n | a1 -> origin | a2 -> destination | a3 -> aux
<<<<<<< HEAD


	jal moveDisc1 		# a0-> n , a1 -> origin, a2 -> destination

	add $t1,$a1,$zero

	add $a1,$a3,$zero

	add $a3,$a2,$zero

	add $a2,$t1,$zero


=======
<<<<<<< HEAD
	jal moveDisc1 		# a0-> n , a1 -> origin, a2 -> destination
	add $t1,$a1,$zero
	add $a1,$a3,$zero
	add $a3,$a2,$zero
	add $a2,$t1,$zero
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	addi $a0,$a0,+1

	jal moveDisc1 		# a0-> n , a1 -> origin, a2 -> destination

	addi $a0,$a0,-1

	add $t1,$a1,$zero

	add $a1,$a3,$zero

	add $t2,$a2,$zero

	add $a2,$t1,$zero

	add $a3,$t2,$zero
<<<<<<< HEAD



=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	jal hanoi #a0 ->n | a1 -> aux | a2 -> origin | a3 -> destination

	j pop

	

base: 	

	add $a2,$a3,$zero

	jal moveDisc1 	#a0 -> n, a1-> origin, a2-> destination
<<<<<<< HEAD




pop:	#pop stack

	lw $ra, 0($sp)

	lw $a0, 4($sp)

	lw $a1, 8($sp)

	lw $a2, 12($sp)

	lw $a3, 16($sp)

	addi $sp, $sp, 20

	jr $ra	

	

moveDisc1:

	# We start by the saved count of discs, on each tower

	# tower 1 : s3		tower 2 : s4 		tower 3 : s5



=======
<<<<<<< HEAD

pop:	#pop stack
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	addi $sp, $sp, 20
	jr $ra	
	
moveDisc1:
	# We start by the saved count of discs, on each tower
	# tower 1 : s3		tower 2 : s4 		tower 3 : s5
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	#pop stack

pop:	

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

	

	#---------------------------------------------

	#------ Got to do this again------------------

	#---------------------------------------------

	

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

	

moveDisc1:

	# We start by the saved count of discs, on each tower

	# tower 1 : s3

	# tower 2 : s4 

	# tower 3 : s5
<<<<<<< HEAD


=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	

	#inputs 

	#a0 -> n (disc number we move) 

	#a1 -> origin 

	#a2 -> destination

	
<<<<<<< HEAD

	#first check from wich tower we get the disc


=======
<<<<<<< HEAD
	#first check from wich tower we get the disc
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	#first check from wich tower we get 

	#the disc

	

	#push 

	#a1 , s1 , s0

	addi $sp, $sp, -16

	sw $ra, 0($sp)

	sw $a1, 4($sp)

	sw $s1, 8($sp)

	sw $s0, 12($sp)

	#finish push 

	la $s0 , tower1

	#take the disc from origin
<<<<<<< HEAD


=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	bne $a1,$t4,tower2	#if (origin == tower 1)

	addi $s3,$s3,-1		#check this line

	sll $s1,$s3,2		#s1 direction 

	add $s1,$s0,$s1
<<<<<<< HEAD

	j exitcase

	

tower2: bne $a1,$t5,tower3	#else if (origin == tower 2)	



=======
<<<<<<< HEAD
	j exitcase
	
tower2: bne $a1,$t5,tower3	#else if (origin == tower 2)	
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	lw $s2, 0($s1)		#s2 we got the disc to move		<--- maybe we can erase these line.

	sw $zero, 0($s1)	#erase the disc from origin

	j exitcase

	

tower2: bne $a1,$t5,tower3	#else if (origin == tower 2)
<<<<<<< HEAD


=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	addi $s4,$s4,-1		#check this line

	sll $s1,$s4,2		#s1 direction 

	add $s1,$s0,$s1

	addi $s1,$s1,32
<<<<<<< HEAD



=======
<<<<<<< HEAD
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	lw $s2, 0($s1)		#s2 we got the disc to move		<--- maybe we can erase these line.

	sw $zero, 0($s1)	#erase the disc from origin
<<<<<<< HEAD



=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	j exitcase



tower3: #we do not compare. 	#else -> origin == tower 3

	addi $s5,$s5,-1		#check this line

	sll $s1,$s5,2		#s1 direction 

	add $s1,$s0,$s1

	addi $s1,$s1,64
<<<<<<< HEAD



	

exitcase:

	lw $s2, 0($s1)		#s2 we got the disc to move

	sw $zero, 0($s1)	#erase the disc from origin

	#now put the disc into destination

	bne $a2,$t4,to2		#if (destination == tower 1)

	sll $s1,$s3,2		#s1 direction we multiply discs by 4

	add $s1,$s0,$s1	



=======
<<<<<<< HEAD
	
exitcase:
	lw $s2, 0($s1)		#s2 we got the disc to move
	sw $zero, 0($s1)	#erase the disc from origin
	#now put the disc into destination
	bne $a2,$t4,to2		#if (destination == tower 1)
	sll $s1,$s3,2		#s1 direction we multiply discs by 4
	add $s1,$s0,$s1	
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	lw $s2, 0($s1)		#s2 we got the disc to move		<--- maybe we can erase these line.

	sw $zero, 0($s1)	#erase the disc from origin

exitcase:

	#-------------------------------------------------

	#now put the disc into destination

	

	bne $a2,$t4,to2		#if (destination == tower 1)

	sll $s1,$s3,2		#s1 direction we multiply discs by 4

	add $s1,$s0,$s1

	sw $s2, 0($s1)		#s2 move to the destionation tower	
<<<<<<< HEAD


=======
>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	addi $s3,$s3,1	

	j exitmove

	

to2:	bne $a2,$t5,to3		#if (destination == tower 2)

	sll $s1,$s4,2		#s1 direction we multiply discs by 4

	add $s1,$s0,$s1

	addi $s1,$s1,32
<<<<<<< HEAD


	addi $s4,$s4,1

	j exitmove



to3:	#we do not compare	#else -> detination == tower 3

	sll $s1,$s5,2		#s1 direction we multiply discs by 4

	add $s1,$s0,$s1

	addi $s1,$s1,64	

	addi $s5,$s5,1

	

exitmove: 

	sw $s2, 0($s1)		#s2 move to the destionation tower

	jr $ra

	

exit:



=======
<<<<<<< HEAD
	addi $s4,$s4,1
	j exitmove

to3:	#we do not compare	#else -> detination == tower 3
	sll $s1,$s5,2		#s1 direction we multiply discs by 4
	add $s1,$s0,$s1
	addi $s1,$s1,64	
	addi $s5,$s5,1
	
exitmove: 
	sw $s2, 0($s1)		#s2 move to the destionation tower
	jr $ra
	
exit:
=======
>>>>>>> d367ba9c9cd37640d1689d05752be23e041da128
	sw $s2, 0($s1)		#s2 move to the destionation tower	

	addi $s4,$s4,1

	j exitmove

	

to3:	#we do not compare	#else -> detination == tower 3

	sll $s1,$s5,2		#s1 direction we multiply discs by 4

	add $s1,$s0,$s1

	addi $s1,$s1,64

	sw $s2, 0($s1)		#s2 move to the destionation tower	

	addi $s5,$s5,1



exitmove:

	#pop

	#a1 , s1 , s0

	lw $ra, 0($sp)

	lw $a1, 4($sp)

	lw $s1, 8($sp)

	lw $s0, 12($sp)

	addi $sp, $sp, 16

	#finish push 

	jr $ra

	

	

	

exit:

	
	
	
	



	

>>>>>>> 745bddbcaf5cb7d268268568ede62eedb4beaa7c
