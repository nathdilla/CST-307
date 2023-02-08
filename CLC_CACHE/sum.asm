# Author: Nathan Dilla
# This program prompts the user for two numbers and then
# prints the sum of the numbers, specified at runtime by the user.
# $t0 – to hold the first number
# $t1 – to hold the second number
# $t2 – to hold the sum of $t0 and $t1
# $v0 – syscall parameter and return value
# $a0 – syscall parameter

# Process:

# 1. program reads integer and stores it into t0
# 2. program reads second integer and stores it into t1
# 3. t0 and t1 are added and the sum is stored into t2
# 4. results of t2 are then moved into a0 to be printed
.text
.globl main
    main:
        li		$v0, 4      # First prompt to user; load code for print string
        la		$a0, msg1   # load address of msg for printing
        syscall

        li		$v0, 5		# code for read integer
        syscall
        move 	$t0, $v0	# moves user input stored in v0 into temporary register t0

        li		$v0, 4      # Second prompt to user; load code for print string
        la		$a0, msg2   # load address of msg for printing
        syscall

        li		$v0, 5		# code for read integer
        syscall
        move 	$t1, $v0	# moves user input stored in v0 into temporary register t1

        add		$t2, $t0, $t1		# $t2 = $t0 + $t1

        li		$v0, 4      # message to user; load code for print string
        la		$a0, msg3   # load address of msg for printing
        syscall

        move 	$a0, $t2	# $a0 = $t2
        li		$v0, 1      # sum out to user; load code for print integer
        syscall

        li		$v0, 4      # goodbye to user; load code for print string
        la		$a0, goodbye   # load address of msg for printing
        syscall
        
        li		$v0, 10		# TERMINATE PROGRAM
        syscall

            
        
.data
    msg1:    .asciiz     "please enter the first integer: "
    msg2:    .asciiz     "\nplease enter the second integer: "
    msg3:    .asciiz     "\nthe sum of the two numbers is "
    goodbye: .asciiz     "\ngoodbye! :]"
