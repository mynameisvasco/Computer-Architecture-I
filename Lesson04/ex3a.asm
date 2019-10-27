# Mapa de registos
# p: $t0
# pultimo:$t1
# *p $t2
# soma: $t3

	.data
array:	.word 7692, 23, 5, 234
	.eqv print_int10, 1
	.eqv SIZE, 4
	.text
	.globl main

main:	li $t3, 0	# soma = 0
	li $t4, SIZE	# $t4 = SIZE
	sub $t4, $t4, 1	# $t4 = $t4 - 1
	mul $t4, $t4, 4 # $t4 = $t4 * 4 //Inteiros ocupam 4 bytes
	la $t0, array
	addu $t1, $t0, $t4

while:	bgtu $t0, $t1, endwh
	lw $t2, 0($t0)
	add $t3, $t3, $t2
	addiu $t0, $t0, 4
	j while
	
endwh:	move $a0, $t3
	li $v0, print_int10
	syscall
	jr $ra