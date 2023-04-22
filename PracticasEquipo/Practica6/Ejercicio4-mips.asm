# Hernández Navarro Armando - 317340347
# Juan Carlos Zenteno Pompa - 316251608
.data
	n: .word 100
.text

	main:
	
	lw $a1, n #Guardamos n en $f2
	add $a2, $zero, 0 #Guardamos una variable para iteraciones
	jal while #Llamamos al while 
	
	#li $v0, 10
	#syscall 
	
	
	while:
	# while($a2 = 0 < $a1 = n) 
	# $a3 usado como ayuda para operaciones
	# Usamos $f4 para saber si es 1 o -1 en el dividendo
	# Llevaremos el resultado en $f3
		bge  $a2,  $a1, exit
		add $t7, $zero, 2
		div $a2, $t7 #Obtenemos division
		mfhi $a3 #Movemos el  modulo de  la division
		beqz $a3, par #Usamos a3 como condicional
		beq  $a3, 1, impar #Usamos a3 como condicional

		j while #Volvemos al ciclo
		
		
	par:
		add $a3, $zero, 1 #Vuelve a3 = 1 
		addi  $t1, $zero, 2 #Guardamos 2 como constante en t1
		mult $a2, $t1 #Realizamos 2n
		mflo $t2 #Guardamos el resultado de la operacion en t2
		add $a3, $a3, $t2 #Sumamos $a3 = 1 con 2n. 2n + 1
		addi $t4, $zero, 1 #Ya que es par, usamos 1 para division
		div $t5, $t4, $a3 #Realizamos la division y la guardamos en t5
		add $v1, $v1, $t5 #Sumamos $t5 con lo que llevabamos
		
		add $a2, $a2, 1 #Añadimos una iteracion al ciclo#
		j while
		
		
	impar:			
		add $a3, $zero, 1 #Vuelve a3 = 1 
		addi  $t1, $zero, 2 #Guardamos 2 como constante en t1
		mult $a2, $t1 #Realizamos 2n
		mflo $t2 #Guardamos el resultado de la operacion en t2
		add $a3, $a3, $t2 #Sumamos $a3 = 1 con 2n. 2n + 1
		addi $t4, $zero, -1 #Ya que es imparpar, usamos 1 para division
		div $t5, $t4, $a3 #Realizamos la division y la guardamos en t5
		add $v1, $v1, $t5 #Sumamos $t5 con lo que llevabamos
		
		add $a2, $a2, 1 #Añadimos una iteracion al ciclo#
		j while
		
		
	exit:
		add $v1, $a2, $zero #Guardamos el valor en $v0 y terminamos