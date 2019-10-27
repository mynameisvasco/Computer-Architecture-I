# i = $t0
# lista = $t1
# lista + 1 = $t2
	.data
	.eqv SIZE, 5
str1:	.asciiz "\n Introduza um numero: "
	.align 2

lista:	.space 20			# SIZE * 4
	.eqv read_int, 5
	.eqv print_string, 4
	.text
	.globl main
	
main:	li $t0, 0			# i = 0

while:	bge $t0, SIZE, endw		# while (i < SIZE) {
	li $v0, print_string
	la $a0, str1
	syscall				#	print_string(str1);
	li $v0, read_int
	syscall
	la $t1, lista			# 	$t1 = lista
	sll $t2, $t0, 2			#	(INTEIROS i * 4)
	addu $t2, $t2, $t1
	sw $v0, 0($t2)			#	lista[i] = read_int();
	addi $t0, $t0, 1		# 	i++;
	j while
	
endw:	jr $ra				# }
	
	
	