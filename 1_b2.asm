# 1- Escreva em assembly estrutura equivalente a:
# a) for(i=0;i<=10;i++), printf("%d\n",i); 
# b) int soma=0,x=1; while(x!=0) {scanf("%d",&x);soma+=x;} printf("%d\n",soma); 
# b) int soma=0,x; do {scanf("%d",&x);soma+=x;} while(x!=0); printf("%d\n",soma); * 
# 2 - Escreva uma função para converter de Celcius(entrada) para fahrenheit(saída)
# 3 - Escreva uma função que receba a nota da AV1  e retorne a nota mínima necessária para ser aprovado por média

.data
	space: .asciiz "\n"	
	msg: .asciiz "FIM"
	msgPrompt: .asciiz "PROMPT:"
.text 
	main:
		addi $t0, $zero, 1 # SUM = 0
		addi $t1, $zero, 0 # INPUT = 0
		
		do:
			# PROMPT MSG
			la $v0, 4
			la $a0, msgPrompt
			syscall
			
			# PROMP INPUT
			li $v0, 5
			syscall
			
			move $t0, $v0 # Move INPUT to SUM
			
			add $t1, $t0, $t1 
			add $a0, $zero, $t1 # SUM = SUM + TEMP
			
			jal printSUM
			
		while:
			beq $t0, $zero, exit # ==0?, exit
			j do
			
		exit:
			li $v0, 4
			la $a0, msg
			syscall
		
		# End of the Program
		li $v0, 10
		syscall
		
	printSUM: 
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		jr $ra
