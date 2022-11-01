# 1- Escreva em assembly estrutura equivalente a:
# a) for(i=0;i<=10;i++), printf("%d\n",i); 
# b) int soma=0,x=1; while(x!=0) {scanf("%d",&x);soma+=x;} printf("%d\n",soma); 
# b) int soma=0,x; do {scanf("%d",&x);soma+=x;} while(x!=0); printf("%d\n",soma);
# 2 - Escreva uma função para converter de Celcius(entrada) para fahrenheit(saída) *
# 3 - Escreva uma função que receba a nota da AV1  e retorne a nota mínima necessária para ser aprovado por média

.data
	space: .asciiz "\n"	
	fim: .asciiz "FIM"
	msgPrompt: .asciiz "Digite a temperatura em Graus Celsius: "
	msgOutPut: .asciiz "A temperatura em Graus Celsius em Farhenheint vale: "
	c1: .float 1.80
	c2: .float 32
	zero: .float 0.0
.text 
	main:
		li $v0, 4
		la $a0, msgPrompt
		syscall
		
		li $v0, 6 # input > $f6
		syscall
		
		jal cel_fah
		
		jal printConversion
		
		jal exit
		
	exit:
		li $v0, 4
		la $a0, fim
		syscall	
		
	# End of the Program
	li $v0, 10
	syscall
				
	cel_fah: 
		lwc1 $f1, c1
		lwc1 $f2, c2
		
		mul.s $f3, $f0, $f1
		add.s $f12, $f2, $f3
		
		jr $ra	
	
	printConversion: 
		la $v0, 4
		la $a0, msgOutPut
		syscall
	
		li $v0, 2 
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		jr $ra


