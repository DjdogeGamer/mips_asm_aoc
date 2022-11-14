.data
	msg1: .asciiz "Multiplicando: "
	msg2: .asciiz "Multiplicador: "
	msg3: .asciiz "Produto: "
.text
 
# Multiplicando
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall

	move $t1, $v0

# Multiplicador
	li $v0, 4
	la $a0, msg1
	syscall	

	li $v0, 5
	syscall

	move $t2, $v0

# Acumuladores
	li $t3, 0 #Produto
	li $t4, 0 #Contador
	
# Pegar o bit menos significativo
	loop:
		bge $t4, 32, exit # Testa fim do loop
		andi $t5, $t2, 1
		beq $t5, 0, desloca_bits
		add $t3, $t3, $t1
		j desloca_bits
		
		desloca_bits:
	  		sll $t1, $t1, 1 #Multiplicando para a esquerda
	  		srl $t2, $t2, 1 #Multiplicador para a direita
	  		add $t4, $t4, 1 #Incrementa contador
	  		j loop
	exit:
		
		li $v0, 4
		la $a0, msg3
		syscall	
		
		li $v0, 1
		move $a0, $t3
		syscall
		
	  	
	  			  
	      
	
	
	
	
	
	
