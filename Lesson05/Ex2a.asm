# p = $t0
# *p = $t1
# lista+Size = $t2
	.data 
str1:	.asciiz "; "
str2:	.asciiz "\nConteudo do array:\n"
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.eqv print_int10, 1
	.eqv print_string, 4
	.eqv SIZE, 10
	.text
	.globl main	
	
main:	li $v0, print_string
	la $a0, str2
	syscall			# print("Conteudo do Array")
	la $t0, lista
	li $t2, SIZE
	sll $t2, $t2, 2
	addu $t2, $t2, $t0	# $t2 = lista + SIZE

while:	bgeu $t0, $t2, endwh	# while( p < lista + SIZE)  {
	lw $t1, 0($t0)
	li $v0, print_int10
	move $a0, $t1
	syscall			# 	print(*p)
	li $v0, print_string
	la $a0, str1
	syscall			#	print(";")
	addiu $t0, $t0, 4 
	j while			# }

endwh:	jr $ra
