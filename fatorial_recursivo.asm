.data
	inputMSG: .asciiz	 "Digite um numero para tirar seu fatorial: "
	outPutMSG: .ascii	 "\nFatorial do numero digitado: "
	num:	.word	0 
	asw:	.word	0 
	
.text
	.globl main 
	main:
		# Input N
		li $v0, 4
		la $a0, inputMSG
		syscall
			
		li $v0, 5
		syscall
		
		sw $v0, num
		
		# Chama Funcao 
		lw $a0, num
		jal acharFatorial
		sw $v0, asw
		
		# Print Output  
		li $v0, 4
		la $a0, outPutMSG
		syscall
		
		li $v0, 1
		lw $a0, asw
		syscall
		
		# Fim do Programa
		li $v0, 10
		syscall 
		
# Funcao Fatorial
.globl acharFatorial
acharFatorial:
	subu $sp, $sp, 8
	sw $ra, ($sp)
	sw $s0, 4($sp)
	
	# Caso Base
	li $v0, 1
	beq $a0, 0, fatorialPronto
	
	# Achar fatorial (n - 1)
	move $s0, $a0
	sub $a0, $a0, 1
	jal acharFatorial
	
	# Regiao de Recursao
	mul $v0, $s0, $v0
	
	fatorialPronto:
		lw $ra, ($sp)
		lw $s0, 4($sp)
		addu $sp, $sp, 8	
		jr $ra