.data 
	# area: Dados da memoria principal
	
.text
	# area: Instrucoes do programa

	# operacao simples de soma

	li $t0, 10
	li, $t1, 15
	add $s0, $t0, $t1

	syscall # executa

	li $v0, 10 # encerra programa 
	syscall
