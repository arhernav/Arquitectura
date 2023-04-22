# Hernández Navarro Armando - 317340347
# Juan Carlos Zenteno Pompa - 316251608
.data
n1: .word 60
n2: .word 45

.text
.globl main
main:
    lw $a0,n1  #Cargamos n1 a $a0
    lw $a1,n2  #Cargamos n2 a $a1
    jal MCD # Llamamos MCD

    add $a0,$v0,$zero 
    li $v0,1
    syscall # Imprimimos resultado
li $v0, 10 # Finalizacion del programa
syscall

MCD:
	## Se usan $a0 y $a1 como parametros
    addi $sp, $sp, -12
    sw $ra, 0($sp) #Almacenamos la funcion en el stack
    sw $s0, 4($sp) # Almacenamos $s0 en el stack
    sw $s1, 8($sp) # Almacenamos $s1 en el stack

    add $s0, $a0, $zero # s0 = a0 (  n1 ) 
    add $s1, $a1, $zero # s1 = a1 (  n2 ) 
    addi $t1, $zero, 0 # $t1 = 0
    beq $s1, $t1, returnn1 # Caso base. Si s1 = 0 regresamos

    add $a0, $zero, $s1 # asignamos a0 = $s1
    div $s0, $s1 # n1/n2
    mfhi $a1 # cociente de n1/n2 

    jal MCD

exitMCD:
    lw $ra, 0 ($sp)  # Volvemos a los registros del stack
    lw $s0, 4 ($sp)
    lw $s1, 8 ($sp)
    addi $sp,$sp , 12 # Recuperamos los registros del stack
    jr $ra
returnn1:
    add $v0, $zero, $s0 
    j exitMCD
