# Hernández Navarro Armando - 317340347
# Juan Carlos Zenteno Pompa - 316251608
.data
	dividendo:  .word 222 # Numero que se usara  como dividendo
	divisor: .word 4 #Numero que se usara como divisor
.text

	main:
	lw $a0, dividendo # Cargamos el dividendo al registro a0
	lw $a1, divisor # Cargamos  el dividendo al registro a1
	
	jal while # Llamamos al while con los parametros en $a0 y $a1
	
	
	
	
	while:
	# Usa como parametros Dividendo = $a0, Divisor = $a1
		blt $a0, $a1, exit # Salida del ciclo.
		
		sub $a0, $a0, $a1 # Restamos al  dividendo
		addi $v0, $v0, 1  # Añadimos 1 al cociente
		
		j while #Reiniciamos el loop en caso de que no haya salido
	
	
	exit:
		#El cociente ya esta en el registro $v0, por el ciclo while
		#Recordar que en los registros, el valor se expresa en exadecimal
		
		add $v1, $a0,  $zero #Almacenamos el residuo en el registro $v1
		