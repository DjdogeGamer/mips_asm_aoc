# 1- Escreva em assembly estrutura equivalente a:
# a) for(i=0;i<=10;i++), printf("%d\n",i); *
# b) int soma=0,x=1; while(x!=0) {scanf("%d",&x);soma+=x;} printf("%d\n",soma);
# b) int soma=0,x; do {scanf("%d",&x);soma+=x;} while(x!=0); printf("%d\n",soma);
# 2 - Escreva uma função para converter de Celcius(entrada) para fahrenheit(saída)
# 3 - Escreva uma função que receba a nota da AV1  e retorne a nota mínima necessária para ser aprovado por média

.data
	space: .asciiz "\n"	
	msg: .asciiz "FIM"
.text 
	main:
		# i = 0
		addi $t0, $zero, 0
		
		while:
			bgt $t0, 10, exit # >10?, exit
			jal printN
			addi $t0, $t0, 1 # i++
			
			j while
			
		exit:
			li $v0, 4
			la $a0, msg
			syscall
		
		# End of the Program
		li $v0, 10
		syscall
		
	printN: 
		li $v0, 1
		add $a0, $t0, $zero
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		jr $ra