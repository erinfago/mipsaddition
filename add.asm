	.data
n:      .word 9
list:   .space 36 
m:	.word 9
list2:	.space 36
	.text
	
main:
	#int n = 9
	lw $t0, n
	lw $t5, m
	#int a[9]
	la $t1, list
	la $t6, list2
	#int i = 0
	li $t2, 0
	li $t7, 0
	#temp using in the loop for i+1
	li $t3, 0
	li $t8, 0
	#temp using for int*c = a
	add $t4, $t1, $zero
	add $t9, $t6, $zero
	
	j loop
#fill the arrays 	
loop:
	beq $t2, $t0, endloop
	addi $t3, $t2, 1
	
	sw   $t2, 0($t4)
	sw   $t2, 0($t9)
	#c++
	add  $t4, $t4, 4
	add  $t9, $t9, 4

	add  $t2, $t3, $zero
	j    loop
	
endloop: 
	#reset to 0 to begin looping from 0 in addloop
	li $t2, 0
	j addloop
	
#add the arrays and store in first array
addloop:
	beq $t2, $t0, addendloop
	addi $t3, $t2, 1
	
	#get info at ar1[$t2] and ar2[$t2] and store
	add $a0, $t4, $0
	add $a1, $t9, $0
	
	# store in $t4 and add a0 + a1 which = ar1[i] + ar2[i] 
	add $t4, $a0, $a1
	
	#move to next spot in array
	add  $t4, $t4, 4
	add  $t9, $t9, 4

	add  $t2, $t3, $zero
	
	#loop back to top to check condition	
	j addloop

addendloop:
	#exit
	li $v0, 10
	syscall
