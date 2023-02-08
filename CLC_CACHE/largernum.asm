# t0 - stores the first number
# t1 - store the second number
# t2 - store result of comparison
# t3 - store greater num
# Author: Nathan Dilla 2/4/23
# This program prompts the user to enter two numbers, then displays
# the larger number.
# Overview: The welcome message first appears then prompts the user to enter
# a number. The number is stored into t0, A second prompt for the second number
# and is stored into t1. They are compared and the result is stored into t2
# the largest number is stored into t3 then transfered to a0 to be printed.
.text
.globl main
main:  
    li		$v0, 4		        # $v0 =4 ; first prompt to the user
    la		$a0, prompt1
    syscall
                                # get first number 
    li		$v0,  5		        # read integer
    syscall

    move 	$t0, $v0	        # $t0 = v0
    # --------------------------------------
    li		$v0, 4		        # $v0 =4 ; second prompt to the user
    la		$a0, prompt2		# 
    syscall
                                # get second number
    li		$v0,  5		        # $v0 = 5 
    syscall

    move 	$t1, $v0	        # $t0 = v0
    # --------------------------------------
    slt		$t2, $t0, $t1		# is t0 greater than t1, store true result to t2
    # --------------------------------------
    beq		$t2, 0, t0IsGreater	# if $t2 =0t1 then goto target
    beq		$t2, 1, t1IsGreater	# if $t2 =1t1 then goto target

t1IsGreater:
    move 	$t3, $t1		    # $t3 = $t1
    j		exit			    # jump to exit
    
t0IsGreater:
    move 	$t3, $t0		    # $t3 = $01
    j		exit			    # jump to exit

exit:
    li		$v0, 4	    	    # $v0 =4 ; print out to user
    la		$a0, out_msg
    syscall
    #-----------------------------------
    li		$v0, 1	        	# $v0 =1 
    move 	$a0, $t3	    	# $a0 = $31
    syscall

    li		$v0, 4	    	    # $v0 =4 
    la		$a0, bye
    syscall

    li		$v0, 10	    	    # terminate program
    syscall

.data
prompt1:   .asciiz "\nenter the first number: "
prompt2:   .asciiz "\nenter the second number: "
out_msg:   .asciiz "\nthe larger number is: "
bye:   .asciiz "\nGoodbye! :]\n"
