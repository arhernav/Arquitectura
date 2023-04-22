# Hernández Navarro Armando - 317340347
# Juan Carlos Zenteno Pompa - 316251608
#Para facilitar el ejercicio, la recursión es usada en la función factrial que se usa como
#soporte para la función BinomialCoefficient
.data 
	n: .word 10
	k: .word 2
.text 

	main:
	
	lw $a1, n #Guardamos n en el registro $a0
	lw $a2, k #Guardamos k en el regstro &a1
	
	# Llamamos a la función  recucrsiva 
	jal BinomialCoefficient
	
	
	#Imprimimos el resultado
	add $a0,$v1, $zero
	li $v0, 1
	syscall 
	
	#Finalización del programa
	li $v0, 10 
	syscall
	########################################### Division para el main
	
	BinomialCoefficient:
	# n = $a1$
	# k = $a2
	#Facatorial usa $a0 como parametro, de modo que obtenemos n!
	add $s3, $zero, $ra 
	add $a0, $zero, $a1
	jal factorial
	
	#Guardamos n! en $t0 y guardamos k en $a0 para obtener k!
	add $t0, $zero, $v0 
	add $a0, $zero, $a2
	jal factorial
	
	# Guardamos k! en $t1 y sacamos el factorial de (n - k)
	add $t1, $zero, $v0
	sub $a1, $a1, $a2 
	add $a0, $zero, $a1
	jal factorial
	
	# Guardamoso (n - k)! en $t3
	#Obtenems k!(n - k)! y lo guardamso en $t2
	#Obtenems n!/k!(n - k)! y lo guardamos en $v1
	#Guardamos el regreso a main en ra y saltamos
	add $t3, $zero, $v0
	mul $t2, $t1, $t3
	div $v1, $t0, $t2
	add $ra, $zero, $s3 #Recrdar que en $s3 estaba a direccin para volver al main
	jr $ra
	
	factorial:
	
	#Preparamos el stack
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	ble $a0, 1, CasoBase
	j CasoRecursivo
	
	
	CasoBase:
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	addi $v0, $zero, 1
	jr $ra
	
	CasoRecursivo:
	addi $a0, $a0, -1
	jal factorial
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	mul $v0, $a0, $v0
	
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
