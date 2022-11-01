# 1- Escreva em assembly estrutura equivalente a:
# a) for(i=0;i<=10;i++), printf("%d\n",i); 
# b) int soma=0,x=1; while(x!=0) {scanf("%d",&x);soma+=x;} printf("%d\n",soma); 
# b) int soma=0,x; do {scanf("%d",&x);soma+=x;} while(x!=0); printf("%d\n",soma);
# 2 - Escreva uma função para converter de Celcius(entrada) para fahrenheit(saída) 
# 3 - Escreva uma função que receba a nota da AV1  e retorne a nota mínima necessária para ser aprovado por média *

.data
	space: .asciiz "\n"	
	fim: .asciiz "FIM"
	msgPrompt: .asciiz "Digite a Primeira Nota: "
	msgOutPut: .asciiz "Nota minima para ficar na media: "
	mediaMinima: .float 14.0
.text 
	main:
		li $v0, 4
		la $a0, msgPrompt
		syscall
		
		li $v0, 6 # Input N1
		syscall
		
		mov.s $f1, $f0 # f0 -> f1
		lwc1 $f2, mediaMinima # mediaMinima -> f2
		
		jal calculaMediaMinima
		jal printMediaMinima
		jal exit
		
	exit:
		li $v0, 4
		la $a0, fim
		syscall	
		
	# End of the Program
	li $v0, 10
	syscall
				
	calculaMediaMinima:
		sub.s $f3, $f2, $f1
		mov.s $f12, $f3
		jr $ra
	
	printMediaMinima: 
		la $v0, 4
		la $a0, msgOutPut
		syscall
	
		li $v0, 2 
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		jr $ra


