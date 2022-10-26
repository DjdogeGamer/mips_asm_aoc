# 3 - crie um programa que receba duas notas e o percentual de frequência.
# Calcule e depois exiba a média das notas e informe se o aluno foi aprovado.
# ( aprovado média >=7 e frequência >= 75.)


.data 

	zero: .float 0.0
	newline: .asciiz "\n"
	msg1: .asciiz "Digite a primeira nota: "
	msg2: .asciiz "Digite a segunda nota: "
	msg3: .asciiz "Media: "
	msg4: .asciiz "Digite a frequencia: "
	msg5: .asciiz "Frequencia: "
	msg6: .asciiz "Aprovado"
	msg7: .asciiz "Reprovado"
	const: .float 2.0
	minFreq: .float 75.0
	minMed: .float 7.0
	
.text
	main:
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
	
		li $v0, 10 # encerra programa 
		syscall
	
	reprovado:
		li $v0, 4 
		la $a0, msg7 #Reprovado
		syscall