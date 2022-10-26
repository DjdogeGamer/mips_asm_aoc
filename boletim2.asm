# 3 - Modificar o exercício 3 (cálculo de média) para: calcular a média de 4 alunos.


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
	const: .float 2.0
	const2: .float 4.0
	minFreq: .float 75.0
	minMed: .float 7.0
	
.text
	main:
		addi $t0, $t0, 0
		
		while:
			bgt $t0, 3, exit
			
			li $v0, 4 
			la $a0, msg1 #"Digite a primeira nota: "
			syscall 

			li $v0, 6 # lÃª nota 1
			syscall
	
			mov.s $f1, $f0 #nota 1 para o $f1
	
			li $v0, 4 
			la $a0, msg2 #"Digite a segunda nota: "
			syscall 

			li $v0, 6 # lÃª nota 2
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
	
			li $v0, 6 # lÃª frequencia
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
			
			addi $t0, $t0, 1
			
			j while
			
		exit:
		
			li $v0, 4 
			la $a0, msg8 #"Media dos alunos: "
			syscall
			
			lwc1 $f1, const2
			div.s $f9, $f9, $f1 #calcula media de todas as notas
			
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
			
			addi $t0, $t0, 1
			
			j while
