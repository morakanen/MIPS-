######################################## Finbonacci Sequence ########################################


.text	#this section is where you write your main script
	
	main:
		# t0 = 0; (essentially i = 0)
		li $t0, 0
		
		# First 2 numbers of the sequence
		li $t1, 0
		li $t2, 1
		
		while:

			beq $t0, 10, exit	# if (i == 10) exit loop  
		
			move $a0, $t1              # prints whatever is stored in register a0.
			li $v0, 1                  # Set the syscall to 1 (print)
			syscall                    # Does Syscall action
			
			la $a0, spacer             # load address of the string
			li $v0, 4      		   # Set the syscall to 1 (print)
			syscall                    # Does syscall action
		
			add $t3, $t1, $t2	# Adds the 2 numbers together into a third register, this is the sequence
		
			#Shuffles values
			add $t1, $t2, $zero # t1 <- t2
			add $t2, $t3, $zero # t2 <- t3
			
			add $t0, $t0, 1 #i++
		
        		j    while 		# Loop starts again
		
		exit:
			li $v0 10		# Set the syscall to 10 (exit)
			syscall			# Does syscall action

# Pre program variable declarations go here (put in RAM)
.data 
	#space aligntment and comas
	spacer: .asciiz ", "