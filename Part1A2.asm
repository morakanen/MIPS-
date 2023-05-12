# Pre program variable declarations go here (put in RAM)
.data 


	array:  .word 1, 0, 0, 3, 2         # you can write any label which ends in a colon such as 'array:' <- PUT YOUR STUDENT NUMBERS HERE
	length: .word 5                     # <--- THIS IS THE NUMBER OF ELEMENTS IN THE ARRAY
	
		
	spacer: .asciiz ", " # Spaces and coma

.text #this section is where you write your main script

	main:
	
		la $t0, array  # la is load address base address  <---- loads the base ADDRESS of the array into $t0
		li $t1, 0     # i=0 
		lw $t2, length #store length 5 into $t2
		li $t3, 0      #sum = 0
 		


		mul $t4, $t2, 4 # End condition of loop 
		
		add $s1, $t0, $zero # s1 = address of array  
		
		lw $t8, 0($s1) # t8 = Hold the 'min' value
		lw $t9, 0($s1) # t9 = Hold the 'max' value

 	  	 while:
 	  	 	
 	  	 	beq $t1, $t4, finish # if (i == end condition) proceed to finish
			
     			add $s1, $t0, $t1  # Move array access address to i)
			
			lw $t6, 0($s1)  # Read array from said position and store it in t6
			
			add $t3, $t3, $t6 #add total
			
			add $t1, $t1, 4 # i+4 
		
                	slt   $s0, $t6, $t8 # if(t6 < smallest value) s0 = 1;
                	
                	bne  $s0, $zero, min  # if False(Call 'min' label)
                	
                	slt $s0, $t9, $t6     # Checks if $t9 < $t6 == 1
                	
                	bne $s0, $zero, max    #if False
                			       # Branch if $s0 && $zero not equal to max
                
                	j    while      # Jumps back  to start
                
                min:	#called when t6 is smallest value
                
                    	add $t8, $t6, $zero #sets smalles value to current
                    	
                    	j    while 	# Jump back to loop start
                    
                max:	#called when t6 is largest
                
                    	add $t9, $t6, $zero    #Replaces t9 with t6
                    	j    while 	# Jump back to start
		
		finish:
			move $a0, $t8              # Set a0 to t8 (set smalles value we want to print)
			li $v0, 1                  # Set syscall to 1  (print)
			syscall                    # Does syscall
			
			la $a0, spacer             # loads string
			li $v0, 4      		   # Set syscall to 1 (print)
			syscall                    # Does syscall

			move $a0, $t9              # set a0 to t9 (set largest value to print
			li $v0, 1                  # Set syscall to 1 (print)
			syscall                    # Does syscall
		
			la $a0, spacer             # load string
			li $v0, 4      		   # Set syscall to 1 (print)
			syscall                    # Does syscall
			

			div $t3, $t3, $t2 	#Does average (t3 = t3 / t2) (t3 = sum / total)
			
			move $a0, $t3              #  Set a0 to t3 (set average value we want to print)
			li $v0, 1           	   # Set syscall to 1 (print)
			syscall                    # Does syscall
		
			la $a0, spacer             # loads string
			li $v0, 4      		   # Set syscall to 1 (print)
			syscall                    # Does
			
			# Finish
			j exit



		
		
		# Terminate program 
		exit: 	
			li $v0 10     #### THIS IS A GOOD WAY TO END THE PROGRAM BY PUTTING THE VALUE 10 INTO $v0 AND USING SYSCALL
			syscall
