#Modificar o exercício 3 (cálculo de média) para: calcular a média de N alunos 

.data 

	zero: .float 0.0
	newline: .asciiz "\n"
	msg1: .asciiz "Digite a primeira nota: "
	msg2: .asciiz "Digite a segunda nota: "
	msg3: .asciiz "Media: "
	msg4: .asciiz "Digite a frequencia: "
	msg5: .asciiz "Frequencia: "
	msg6: .asciiz "Aprovado\n"
	msg7: .asciiz "Reprovado\n"
	msg8: .asciiz "Media dos alunos: "
	msg9: .asciiz "Digite a quantidade de alunos: "
	const: .float 2.0
	minFreq: .float 75.0
	minMed: .float 7.0
	
.text
	main:
		
		li $v0, 4 
		la $a0, msg9 # "Digite a quantidade de alunos: "
		syscall 
		
		li $v0, 5 # lê quantidade de alunos
		syscall
		
		sub $v0,$v0, 1
		move $t0, $v0
		move $t1, $zero
		
		while:
			bgt $t1, $t0, exit
			
			li $v0, 4 
			la $a0, msg1 #"Digite a primeira nota: "
			syscall 

			li $v0, 6 # lê nota 1
			syscall
	
			mov.s $f1, $f0 #nota 1 para o $f1
	
			li $v0, 4 
			la $a0, msg2 #"Digite a segunda nota: "
			syscall 

			li $v0, 6 # lê nota 2
			syscall
	
			mov.s $f2, $f0 #nota 2 para o $f2
	
			#Calculo da media
			add.s $f3, $f1, $f2
			lwc1 $f4, const
			div.s $f5, $f3, $f4
	
			mov.s $f12, $f5
			
			add.s $f9, $f5, $f9 #registrador para acumular a soma das medias
	
			li $v0, 4 
			la $a0, msg3 #"Media: "
			syscall
	
			li $v0, 2 #imprime media
			syscall
	
			li $v0, 4
			la $a0, newline
			syscall # "\n"
	
			li $v0, 4 
			la $a0, msg4 #"Digite a frequencia: "
			syscall
	
			li $v0, 6 # lê frequencia
			syscall
	
			mov.s $f6, $f0 #frequencia para $f6
			mov.s $f12, $f6
	
			li $v0, 4 
			la $a0, msg5 #"Frequencia: "
			syscall
	
			li $v0, 2 #imprime frequencia
			syscall
		
			li $v0, 4
			la $a0, newline
			syscall # "\n"
	
			lwc1 $f7, minFreq #Minimo necessario frequencia
			lwc1 $f8, minMed #Minimo necessario media
	
			c.lt.s $f6, $f7
			bc1t reprovado
		
			c.lt.s $f5, $f8
			bc1t reprovado
		
			li $v0, 4 
			la $a0, msg6 #"Aprovado"
			syscall
			
			li $v0, 4
			la $a0, newline
			syscall # "\n"
			
			addi $t1, $t1, 1
			
			j while
			
		exit:
		
			li $v0, 4 
			la $a0, msg8 #"Media dos alunos: "
			syscall
			
			mtc1 $t1, $f0
			cvt.s.w $f0, $f0
			
			div.s $f9, $f9, $f0 #calcula media de todas as notas
			
			mov.s $f12, $f9
	
			li $v0, 2 #imprime media
			syscall
			
			li $v0, 10 # encerra programa 
			syscall
	
		reprovado:
			li $v0, 4 
			la $a0, msg7 #Reprovado
			syscall
			
			li $v0, 4
			la $a0, newline
			syscall # "\n"
			
			addi $t1, $t1, 1
			
			j while
