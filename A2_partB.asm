##### A2 Stage 2 Part B Fibonacci Sequence ########

.text ##<--- this sets up main body of the code

    main: #<---- label main, not neccessary here but good practice

        li $t0,0 # stores first value
        li $t1,1 # stores second value
        li $t2,0 # sum of t1 and t0
        li $t3,1 # nth value of the fibonacci sequence
        li $t4,9 # counter (The number of values we need)

        While:beq $t3,$t4 ,exit # end condition of while loop(if counter is equal to  10 values)
        add $t2,$t0,$t1 # storing into $t2 from the addition of t0 and t1
        move $t0, $t1 # replacing the value inside $t0 by $t1
        move $t1, $t2  # replacing the value inside $t0 by $t1


        add $t3, $t3, 1 # increment i by 1
	j While
    exit:
             #### THIS IS A GOOD WAY TO END THE PROGRAM BY PUTTING THE VALUE 10 INTO $v0 AND USING SYSCALL
       		move $a0, $t8              # Set a0 to t8 (set smallest value we want to print)
		li $v0, 1                  # Set syscall to 1  (print)
		syscall                    # Does syscall
