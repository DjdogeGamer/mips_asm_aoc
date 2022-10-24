
# 1 - crie o código que mostre “hello world” na tela.

.data 
	# area: Dados da memoria principal
	msg: .asciiz "hello world" #imprime mensagem
.text
	# area: Instrucoes do programa
	
	li $v0, 4 #instrucao para impressao de string
	la $a0, msg # indica o endreco da mensagem (a0)
	syscall # executa
