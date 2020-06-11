# long add function in steps
#only 2 operands and one operator at a time (sub or add in this case)
# a-b
# c-d
# (a-b) + (c-d)
# e-f
# ((a-b) + (c-d)) + (e-f)
# (((a-b) + (c-d)) + e-f) + (g)
	
		
	.data
	.text

main:
#load in the values for values
	li $s1, 100
	li $s2, 10
	li $t2, 90
	li $t3, 9
	li $t4, 80
	li $t5, 8
	li $t6, 110

	#set a's the parameters
	addi $a0,$0,100   
        addi $a1,$0,10   
        addi $a2,$0,90  
        addi $a3,$0,9
        
        #call long add
	jal long_add
	
	la $a0, ($v0) #return variable
	la $a1, ($t4)
	
	la $a2, ($t5)
	la $a3, ($t6)
	
	#call regular add
	jal add2
	
	#keep updating the addition to s1
	add $s1, $s1, $s2
	add $s1, $s1, $t2
	add $s1, $s1, $t3
	add $s1, $s1, $t4
	add $s1, $s1, $t5
	add $s1, $s1, $t6
	add $s1, $s1, $v0
	
	#syscalls 
	#   1 = int print 
	#   10 = exit
	#int print $s1 --> (((a+b) + (c+d)) + ((e+f) + (g +longadd))
        li $v0,1
	move $a0,$s1
	syscall
	
	li $v0,10
	syscall
        
#from textbook
long_add:
	addi $sp, $sp, -12
	sw $t1, 8($sp)
	sw $t0, 4($sp)
	sw $s0, 0($sp)
	
	sub $t0,$a0,$a1
	sub $t1,$a2,$a3
	add $s0,$t0,$t1
	
	add $v0,$s0,$zero  # return
	
	lw $s0, 0($sp) # restore register $s0 
	lw $t0, 4($sp) # restore register $t0 
	lw $t1, 8($sp) # restore register $t1 
	addi $sp, $sp, 12
	
	#syscall
	
	jr $ra 

#from textbook
add2:
	#create the space
	addi $sp, $sp,-12
	
	#assign names to the spaces
	sw $t1, 8($sp)
	sw $t0, 4($sp)
	sw $s0, 0($sp)
	
	sub $t0, $a1, $a2
	add $t1, $a0, $t0
	add $s0, $t1, $a3
	
	#tells what to return
	add $v0, $s0, $zero
	
	lw $s0, 0($sp) # restore register $s0
	lw $t0, 4($sp) # restore register $t0
	lw $t1, 8($sp) # restore register $t1
	addi $sp, $sp, 12
	
	jr $ra 

	
