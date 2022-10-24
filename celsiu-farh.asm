# 2 - faça um programa que leia a temperatura em graus celsius, converta e exiba o valor da temperatura em graus Fahrenheit.

.data 
	# area: Dados da memoria principal
	zero: .float 0.00
	msg1: .asciiz "Digite uma temperatura em Celsius: "
	msg2: .asciiz "A temperatura Celsius em Farhenheint vale: "
	const1: .float 1.80
	const2: .float 32

.text
	# area: Instrucoes do programa
	
	# ler entradas 
	
	li $v0, 4 
	la $a0, msg1 # imprime msg1 
	syscall 

	li $v0, 6 # ler numero
	 # executa leitura
	
	lw $t0, const1
	lw $t1, const2
	
	# (0 °C × 9/5) + 32 = 32 °F

	mul $v1, $v0, $t0
	add $t2, $t1, $v1

	li $v1, 2 # executa a impressao
	syscall

	li $v0, 10 # encerra programa 
	syscall     
