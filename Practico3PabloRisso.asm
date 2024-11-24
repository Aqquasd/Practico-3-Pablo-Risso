					
					.data					
options:          	.asciiz "\nSeleccione una de las siguientes opciones:"
crearCat:         	.asciiz "\n\t1. Agregar nueva categoria"
agregarNodo:      	.asciiz "\n\t2. Eliminar categoria actual"
agregarObj:       	.asciiz "\n\t3. Agregar nuevo objeto a categoria actual"
mostrarLista: 	  	.asciiz "\n\t4. Mostrar categorias y objetos"
antCat:          	.asciiz "\n\t5. Ir a la siguiente categoria"
sigCat:          	.asciiz "\n\t6. Ir a la categoria anterior"
deleteObj:        	.asciiz "\n\t7. Borrar objeto de la categoria actual"
quitMenu:         	.asciiz "\n\t0. Para salir del menu"
marcador:      		.asciiz "\nSu respuesta: "

opcion1:          	.asciiz "\n- Agregar una nueva catogoria\n"
opcion2:          	.asciiz "\n- Eliminar categoria actual\n"
opcion3:          	.asciiz "\n- Agregar nuevo objeto a categoria actual\n"
opcion4:          	.asciiz "\n- Mostrar categorias\n"
opcion5:          	.asciiz "\n- Ir a la siguiente categoria\n"
opcion6:          	.asciiz "\n- Ir a la categoria anterior\n"
opcion7:          	.asciiz "\n- Borrar el objeto de la categoria actual\n"

						# Agregar Nodo
cabeza:             		.word   0
cola:             		.word   0
nomCategoria:      		.asciiz "\n\tIngrese el nombre de la categoria: "
mensajeExitoso:   		.asciiz "\n\tExito: categoria ingresada\n"
finMensaje:       		.asciiz "\n\nFin del programa\n"
buffer:           		.space  16

mensajePrimerNodo: 		.asciiz "\tAgrega la primer categoria\n"
mensajeNuevoNodo:   		.asciiz "\tAgrega una nueva categoria\n"


						# Imprimir Lista
noObj:        			.asciiz "\nNo tiene objetos ligados\n"
listaVacia:        		.asciiz "La lista esta vacia\n"
asteristico:         		.asciiz "\n\t*"
doblePuntos:            	.asciiz ": "
coma:            		.asciiz ","
id:               		.asciiz "ID: "


EjValida:        .asciiz "\nOperacion exitosa\n"

						# Todos los errores
Error101:    .asciiz "Opcion no valida"
						#Al seleccionar categorias
Error201:    .asciiz "error 201: no existen categorias a cambiar"
						# Al imprimir o listar las categorias
Error301:    .asciiz "error 301: no existen categorias para listar"
						# Al borrar una categoria
Error401:    .asciiz "error 401: no hay categorias para borrar"
						# Al anexar u agregar un objeto
Error501:    .asciiz "error 501: no existen categorias para agregar un objeto"
						# Al listar los objetos
Error601:    .asciiz "error 601: no hay categorias creadas para listar objetos"
						#Al borrar un objeto con un ID especifico 
Error701:    .asciiz "error 701: no hay categorias para borrar objetos"



						#Siguiente Categoria
mensajeActualCat:      	.asciiz "\n La categoria actual es: "

						#Eliminar Nodo
delUnNodo:             	.asciiz "\n\tSe eliminara el unico elemento existente\n"
mensajeDelExitoso:   	.asciiz "\n\tSe ha eliminado el nodo seleccionado\n"
mensajeListaObjVacia: 	.asciiz "\n\tLa categoria no tiene objetos ligados que borrar"
seraDel:  		.asciiz "\n\tSe borrara solo la categoria indicada"

						#Agregar Objeto
aggNuevoObj:      	.asciiz "\n\tSe agregara el nuevo objeto dentro de la categoria: "
aggObjAtajo:  		.asciiz "\n\tIngresar la keyword del objeto: "
mensajeAggPrimerObj:    .asciiz "\n\tAgrega el primer objeto de la lista"
mensajeAggOtroObj:     	.asciiz "\n\tAgrega un objeto mas a la lista"
mensajeAggObjExitoso:   .asciiz "\n\tExito: objeto agregado\n\n"

						#Eliminar Objeto
ingresarObjID:       	.asciiz "\nIngrese el ID del objeto ligado a "
buscarID:             	.asciiz "\nID hallado, el object es: "
objVacioONada:   	.asciiz "\n\tEl ID no ha sido encontrado\n\n"


						#General
nuevaLinea: 		.asciiz "\n"
tab:     		.asciiz "\t"

						#Profesor
slist:   		.word 0

.text
main:

loop:	  
      jal printMenu
      # Forzar a tomar la decision
      jal getChoice

      # Switch
      seq $t0, $v0, 1
      bne $t0, $zero, A
      seq $t0, $v0, 2
      bne $t0, $zero, B
      seq $t0, $v0, 3
      bne $t0, $zero, C
      seq $t0, $v0, 4
      bne $t0, $zero, D
      seq $t0, $v0, 5
      bne $t0, $zero, E
      seq $t0, $v0, 6
      bne $t0, $zero, F
      seq $t0, $v0, 7
      bne $t0, $zero, G
      bne $t0, $zero, exit
      li $v0, 4
      la $a0, Error101
      syscall
      j loop
	
A:
      la    $a0, opcion1
      li    $v0, 4
      syscall

    # Hacer la invocacion de la funcion addNode
      la  $a0, cabeza
      la  $a1, cola
      jal addNode
      li $v0, 4
      la $a0, EjValida
      syscall
      j loop
B:
      la    $a0, opcion2
      li    $v0, 4
      syscall
    
    # Hacer la invocacion de la funcon deleteNode
      la  $a0, cabeza
      la  $a1, cola
      jal deleteNode
      li $v0, 4
      la $a0, EjValida
      syscall
      j loop
C:
      la    $a0, opcion3
      li    $v0, 4
      syscall
    
    # Hacer la invocacion de la funcon addObject
      la  $a0, cabeza
      jal addObject
      li $v0, 4
      la $a0, EjValida
      syscall
      j loop
D:
      la    $a0, opcion4
      li    $v0, 4
      syscall

    # Hacer la invocacion de la funcion printList
      la  $a0, cabeza
      jal printList
      li $v0, 4
      la $a0, EjValida
      syscall
      j loop
E:
      la    $a0, opcion5
      li    $v0, 4
      syscall

    # Hacer la invocacion de la funcion nextCategory
      la  $a0, cabeza
      la  $a1, cola
      jal nextCategory
      li $v0, 4
      la $a0, EjValida
      syscall
      j loop
F:
      la    $a0, opcion6
      li    $v0, 4
      syscall

	# Hacer la invocacion de la funcion prevCategory
      la  $a0, cabeza
      la  $a1, cola
      jal prevCategory 
      li $v0, 4
      la $a0, EjValida
      syscall
      j loop

G:    la    $a0, opcion7
      li    $v0, 4
      syscall

    # Hacer la invocacion de la funcion deleteObject
      la  $a0, cabeza
      jal deleteObject
      li $v0, 4
      la $a0, EjValida
      syscall
      j loop


printMenu:
      la    $a0, options
      li    $v0, 4
      syscall
      la    $a0, crearCat
      syscall
      la    $a0, agregarNodo
      syscall
      la    $a0, agregarObj
      syscall
      la    $a0, mostrarLista
      syscall
      la    $a0, antCat
      syscall
      la    $a0, sigCat
      syscall
      la    $a0, deleteObj
      syscall
      la    $a0, quitMenu
      syscall

      jr $ra
      

getChoice:
      la    $a0, marcador
      li    $v0, 4
      syscall

      li    $v0, 5                 # Codigo Syscall para leer un entero
      syscall                      # Leo el entero (que ahora esta en $v0)

      jr $ra                       # Retorno al llamado con el valor



# ------------------------------ Add Node -------------------------------------- #

addNode:
    # Recupero cabeza desde $a0
        lw    $t0, ($a0)
        lw    $t1, ($a1)

    # Salvo retorno en la pila: apilar $ra
        addi  $sp, $sp, -4
        sw    $ra, 0($sp)

    # Reservo memoria dinamica
        jal   smalloc
        move  $t3, $v0            # Almacena la direccion newNode
    
    # Pido la categoria del nuevo nodo en $t3 y hago una reserva
        la   $a0, nomCategoria     # Preguntamos el nombre de la categoria
        li   $v0, 4                # Syscall para imprimir String
        syscall

        jal  smalloc
        sw   $v0, buffer

    # Leemos el string ingresado
    # Lee hasta encotrar el '\0' o hasta llenar el buffer
        li   $v0, 8
        lw   $a0, buffer          # a0 ahora contiene el buffer
        li   $a1, 16              # a1 ahora contiene el length
        syscall

    # Almacena la categoria en el primer campo
        lw    $t4, buffer
        sw    $t4, 0($t3)

    # Seteamos a null el objeto ligado a la categoria
        sw    $0,  4($t3)

    # Si el head es NULL, agregamos el primer nodo
        bne   $t0, $0, addNewNode

    # Imprimo mensaje
        la    $a0, mensajePrimerNodo
        li    $v0, 4
        syscall

addFirstNode: 
        la    $t0, ($t3)            # cabeza ahora contiene la direccion de newnode
        la    $t1, ($t3)            # cola   ahora contiene la direccion de newnode
    
    # Actualizar los punteros cola y cabeza
        sw    $t0, cabeza
        sw    $t1, cola

    # Llamar a la funcion para hacer enlaces
        la    $a0, ($t0)            # Paso el cabeza como parametro
        la    $a1, ($t1)            # Paso el cola como parametro
        la    $a2, ($t3)            # Paso el newNode como parametro

        jal   enlaceAddCategory

    # Imprimo mensaje de exito
        la    $a0, mensajeExitoso
        li    $v0, 4
        syscall

    # Desapilar antes de retornar
        lw    $ra, 0($sp)
        addi  $sp, $sp, 4
    # Retorno el llamado
        jr    $ra

    # Sino... agregamos uno mas
addNewNode:
        la    $a0, mensajeNuevoNodo
        li    $v0, 4
        syscall

        la    $a0, ($t0)            # Paso la cabeza como parametro
        la    $a1, ($t1)            # Paso la cola como parametro
        la    $a2, ($t3)            # Paso el newNode como parametro
        jal   enlaceAddCategory


    # Realiza los enlaces para añadir un nodo a una CELL
    # Como esta funcion es leaf, no hace falta apilar $ra
enlaceAddCategory:
        sw    $a2, 8($a1)
        sw    $a1, 12($a2)
        sw    $a2, cola
        sw    $a0, 8($a2)
        sw    $a2, 12($a0)

    # Desapilar antes de retornar
        lw    $ra, 0($sp)
        addi  $sp, $sp, 4

        jr    $ra


# ------------------------------ Delete Node -------------------------------------- #

deleteNode:
    # Recupero el head y el tail
        lw    $t0, ($a0)
        lw    $t1, ($a1)

    # Inicializo el registro que recorre la lista: $t2
        la    $t2, ($t0)

    # Corroboro que la lista no este vacia
        beq   $t2, $0, error401

    # Salvo el primer retorno en la pila
        addi  $sp, $sp, -4
        sw    $ra, 0($sp)

    # Logica pensada: if (current == (*head) && current == (*tail)  
        bne   $t2, $t0, normalDelete
        bne   $t2, $t1, normalDelete

        la    $a0, delUnNodo
        li    $v0, 4
        syscall

        move  $a0, $t0
        jal deleteAllObjects

        sw    $0, cabeza
        sw    $0, cola

    # Libero el nodo de categoria
        move  $a0, $t2
        jal   sfree

endDeleteObjects:
        la    $a0, mensajeDelExitoso
        li    $v0, 4
        syscall

    # Desapilar antes de retornar
        lw    $ra, 0($sp)
        addi  $sp, $sp, 4

        jr $ra


normalDelete:
        jal deleteAllObjects
        jal enlaceDeleteCategory

        j endDeleteObjects


deleteAllObjects:
    # Obj *current  = NULL
        move  $t3, $0

    # current = cabeza -> obj;
        lw    $t4, 4($t0)
        move  $t3, $t4
    
        beq   $t3, $0, emptyObjectList

doWhileDeletingObj:
        lw    $t3, 8($t3)
    
    # Salvo  el segundo retorno en la pila
        addi  $sp, $sp, -4
        sw    $ra, 0($sp)

    # Liberar la memoria
        move  $a0, $t3
        jal   sfree

        bne   $t3, $t4, doWhileDeletingObj

        move  $t4, $0
        sw    $t4, 4($t0)

    # Desapilar antes de retornar
        lw    $ra, 0($sp)
        addi  $sp, $sp, 4

        jr $ra 

emptyObjectList:
    # Imprimo los mensajes correspondiente
        la    $a0, mensajeListaObjVacia
        li    $v0, 4
        syscall

        la    $a0, seraDel
        li    $v0, 4
        syscall

        jr $ra 

enlaceDeleteCategory:
    # (*cola) = (*cabeza) -> prev;
        lw    $t3, 12($t0)
        move  $t1, $t3
        sw    $t1, cola
		
    # aux = (*cola);
        move  $t4, $t1
		
    # aux -> next = (*cabeza) -> next;
        lw    $t5, 8($t0)
        sw    $t5, 8($t4)
		
    # aux = (*cabeza) -> next;
        move  $t4, $t5
		
    # aux -> prev = (*cabeza) -> prev
        lw    $t5, 12($t0)
        sw    $t5, 12($t4)
		
    # Llamo a la funcion liberar
    # Y salvo el segundo retorno en la pila
        addi  $sp, $sp, -4
        sw    $ra, 0($sp)
    
        move  $a0, $t0
        jal   sfree
		
    # (*cabeza) = aux;
        sw    $t4, cabeza

    # Desapilar antes de retornar
        lw    $ra, 0($sp)
        addi  $sp, $sp, 4

        jr  $ra


# ------------------------------ Add Object -------------------------------------- #

	#   headCat -> $t0; newObj -> $t3; headObj -> $t1; tailObj -> $t2; aux -> $t7git

addObject:
    # Recupero headCat desde $a0
        lw    $t0, ($a0)

	# Salvar el retorno en la pila: apilar $ra
        addi  $sp, $sp, -4
        sw    $ra, 0($sp)

    # Reservo el bloque para el objeto
        jal   smalloc
        move  $t3, $v0

    # Obj *cabezaObj = cabezaCat -> obj;
        lw    $t7, 4($t0)
        move  $t1, $t7
    
    # colaObj = NULL
        move  $t2, $0

    # Imprimir mensaje y la categoria donde se almacenara
        la    $a0, aggNuevoObj
        li    $v0, 4
        syscall

        lw    $a0, 0($t0)
        li    $v0, 4
        syscall

        la    $a0, nuevaLinea
        li    $v0, 4
        syscall

    # Imprimir el segundo mensaje
        la    $a0, aggObjAtajo
        li    $v0, 4
        syscall

	# Leer el string con el nombre del objeto
        jal   smalloc
        sw    $v0, buffer

        li    $v0, 8
        lw    $a0, buffer          # a0 ahora contiene el buffer
        li    $a1, 16              # a1 ahora contiene el length
        syscall

    # Almacena al nombre del objeto en el primer campo
        lw    $t7, buffer
        sw    $t7, 0($t3)

    # Seteamos a null el ID ligado al objeto
        sw    $0,  4($t3)

    # Bloque de if - else
        beq   $t1, $0, objListIsEmpty

objListIsNotEmpty:
        la    $a0, mensajeAggOtroObj
        li    $v0, 4
        syscall

    # colaObj = cabezaObj -> prev;
        lw    $t7, 12($t1)
        move  $t2, $t7
    
    # Get ID
        lw     $t4, 4($t2)

        jal    makeLinksAddObject

    # newObject -> ID = prevID + 1;
        addi   $t4, $t4, 1
        sw     $t4, 4($t3)

endAddObject:
        la     $a0, mensajeAggObjExitoso
        li     $v0, 4
        syscall

    # Desapilar y retornar
        lw    $ra, 0($sp)
        addi  $sp, $sp, 4

        jr $ra


objListIsEmpty:
        la    $a0, mensajeAggPrimerObj
        li    $v0, 4
        syscall

    # newObject -> ID = 1;
        li    $t7, 1
        sw    $t7, 4($t3)

        la    $t1, ($t3)
        la    $t2, ($t3)
    
    # Actualizar los punteros colaObj y cabezaObj
        sw    $t1, 4($t0)
        sw    $t2, 4($t0)

    # Realizar los enlaces correspondientes
        jal   makeLinksAddObject

        j endAddObject

makeLinksAddObject:
    # colaObj -> next = newObject;
        sw     $t3, 8($t2)
		
    # newObject -> prev = colaObj;
        sw     $t2, 12($t3)
		
    # newObject -> next = cabezaObj;
        sw     $t1, 8($t3)
		
    # cabezaObj -> prev = newObject;
        sw     $t3, 12($t1)
        
        jr $ra


# ------------------------------ Print List -------------------------------------- #

printList:
    # Recupero la cabeza desde la variable cabeza
        lw    $t0, ($a0)

    # Inicializo el registro que recorre la lista: $t1
        la    $t1, ($t0)

    # Si head es NULL =>  la lista esta vacia
        beq    $t1, $0, error301

    # Patron con DO While
doWhileCat:
        beq    $t1, $t0, currentCat
       
    # Una vez que imprimo currentCat sigo con el resto
        la     $a0, nuevaLinea
        li     $v0, 4
        syscall

        la     $a0, tab
        li     $v0, 4
        syscall

        lw     $a0, 0($t1)      # Cargamos el nombre de la categoria
        li     $v0, 4           # Syscall para imprimir String
        syscall

continuePrinting:
    # Bloque de codigo para imprimir objetos ligados a la categoria
          lw     $t2, 4($t1)      #cabezaObj = current->obj;
          move   $t3, $t2         #currentObject = cabezaObj;
    
    # Si currentObj es NULL entonces no tiene objetos ligados
          beq    $t3, $0, objIsEmpty
          and    $t7, $t7, $0     # Contador iniciado a cero

    # Segundo patron con DO While
doWhileObj:
    # Imprimir "\n"
            la     $a0, nuevaLinea
            li     $v0, 4
            syscall

    # Imprimir count
            move   $a0, $t7
            li     $v0, 1
            syscall

    # Imprimir doblePuntos
            la     $a0, doblePuntos
            li     $v0, 4
            syscall

    # Imprimir object->content
            lw     $a0, 0($t3)
            li     $v0, 4
            syscall

    # Imprimir coma
            la     $a0, coma
            li     $v0, 4
            syscall

    # Imprimir "\t"
            la     $a0, tab
            li     $v0, 4
            syscall

    # Imprimir id
            la     $a0, id
            li     $v0, 4
            syscall

    # Imprimir object->ID
            lw     $a0, 4($t3)
            li     $v0, 1
            syscall

nextObject:
    #currentObject = currentObject -> next;
        lw     $t3, 8($t3)
      
        addi   $t7, $t7, 1

        bne    $t3, $t2, doWhileObj
    # Fin del bloque de codigo para imprimir objetos

    # Imprimir "\n"
        la     $a0, nuevaLinea
        li     $v0, 4
        syscall

nextCatToPrint:
        lw     $t1, 8($t1)      #current = current -> next;

    # Condicion de salida
        bne    $t1, $t0, doWhileCat
    
    # Salir de la funcion
        jr $ra


currentCat:
        la     $a0, asteristico  # Cargamos el asterisco para indicar la actual
        li     $v0, 4            # Syscall para imprimir String
        syscall

        lw     $a0, 0($t1)       # Cargamos el nombre de la categoria
        li     $v0, 4            # Syscall para imprimir String
        syscall

        j continuePrinting

catIsEmpty:
    # Mostrar mensaje al user
        la     $a0, listaVacia
        li     $v0, 4
        syscall
    
        jr $ra

objIsEmpty:
        la     $a0, noObj
        li     $v0, 4
        syscall
    
        j nextCatToPrint


# ------------------------------ Next category & Prev category -------------------------------------- #

nextCategory:
    # Recupero cabeza desde $a0
        lw    $t0, ($a0)
        lw    $t1, ($a1)
    
    # if (*cabeza == NULL)
        bne   $t0, $0, makeLinksNextCategory

        j error201

makeLinksNextCategory:
    # $t2 = (*cabeza) -> next;
        lw    $t2, 8($t0)
		
    # (*cola) = (*cola) -> next;
        lw    $t3, 8($t1)   
        sw    $t3, cola
		
    # (*cabeza) = $t2;
        sw    $t2, cabeza
    
    # Imprimir categoria actual
        j printCurrentCat



prevCategory:
    # Recupero cabeza desde $a0
        lw    $t0, ($a0)
        lw    $t1, ($a1)
    
    # if (*cabeza == NULL)
        bne   $t0, $0, makeLinksPrevCategory

        j error201

makeLinksPrevCategory:
    # $t2 = (*cabeza) -> prev;
        lw    $t2, 12($t0)
		
    # (*cola) = (*cola) -> prev;
        lw    $t3, 12($t1)   
        sw    $t3, cola
		
    # (*cabeza) = $t2;
        sw    $t2, cabeza

    # Imprimir categoria actual
        j printCurrentCat



printCurrentCat:
        la    $a0, mensajeActualCat
        li    $v0, 4
        syscall

        lw    $a0, 0($t2)
        li    $v0, 4
        syscall

        la    $a0, nuevaLinea
        li    $v0, 4
        syscall

        la    $a0, nuevaLinea
        li    $v0, 4
        syscall

        jr $ra


# ------------------------------ Delete Object -------------------------------------- #

	# headCat -> $t0; headObj -> $t1; tailObj -> $t2; currentObj -> $t3; ID -> $t4; aux -> $t7

deleteObject:
        lw    $t0, ($a0)
        lw    $t7, 4($t0)

    # Salvar el retorno en la pila: apilar $ra
        addi  $sp, $sp, -4
        sw    $ra, 0($sp)

    # Logica: if (head != NULL && head -> obj != NULL)
        beq   $t0, $0, listaVaciaOrAnyObject
        beq   $t7, $0, listaVaciaOrAnyObject 

    # Node *cabezaObj = cabeza -> obj;
        lw    $t1, 4($t0)
		
    # Obj *colaObj = cabezaObj -> prev;
        lw    $t2, 12($t1)
		
    # Obj *currentObj = cabeza -> obj;
        move  $t3, $t1

    # Leer el ID del objeto
    # Cosas que imprimir
        la    $a0, ingresarObjID
        li    $v0, 4
        syscall

        la    $a0, 0($t0)
        li    $v0, 4
        syscall

        la    $a0, doblePuntos
        li    $v0, 4
        syscall

    # Lectura de ID
        li    $v0, 5
        syscall

        move  $t4, $v0

doWhileLookingID:
        lw    $t7, 4($t3)
		
    # if ((currentObj -> ID) == ID)
        bne   $t7, $t4, continueLooking
        
        la    $a0, buscarID
        li    $v0, 4
        syscall

        la    $a0, 0($t3)
        li    $v0, 4
        syscall

        la    $a0, tab
        li    $v0, 4
        syscall

        la    $a0, id
        li    $v0, 4
        syscall

        lw    $a0, 4($t3)
        li    $v0, 1
        syscall

        la    $a0, nuevaLinea
        li    $v0, 4
        syscall

        la    $a0, nuevaLinea
        li    $v0, 4
        syscall

    #  if (currentObj == cabeza -> obj)
        bne    $t3, $t1, normalDeleteObj
		
deletecabezaObject:
    # Elimino el nodo pero tambien tengo que apuntarlo desde la categoria
        move   $a0, $t3
        jal    enlaceDeleteObject
        sw     $v0, 4($t0)

        move   $a0, $t1
        move   $a1, $t3
        jal    updateID
        
        move  $a0, $t3
        jal   sfree

        j endDeleteObj

normalDeleteObj:
        move   $a0, $t3
        jal    enlaceDeleteObject


        move   $a0, $t1
        move   $a1, $t3
        jal    updateID

        move   $a0, $t3
        jal    sfree

        j endDeleteObj

continueLooking:
        lw    $t3, 8($t3)
    
    # Condicion de salida para DO WHILE
        lw    $t7, 4($t3)
        lw    $t6, 4($t2)
        bne   $t7, $t6, doWhileLookingID
    # Fin DO WHILE

listaVaciaOrAnyObject:
        la    $a0, objVacioONada
        li    $v0, 4
        syscall

        j     endDeleteObj

endDeleteObj:
    # Desapilar antes de retornar
        lw    $ra, 0($sp)
        addi  $sp, $sp, 4

        jr    $ra



enlaceDeleteObject:
        lw    $t7, 12($a0)
        lw    $t6, 8($a0)
        sw    $t6, 8($t7)

        lw    $t7, 8($a0)
        lw    $t6, 12($a0)
        sw    $t6, 12($t7)

        move  $v0, $t7
        jr    $ra

error101:
        la     $a0, Error101
        li     $v0, 4
        syscall

        jr $ra

error201: 
    la     $a0, Error201
        li     $v0, 4
        syscall

        jr $ra

error301: 
    la     $a0, Error301
        li     $v0, 4
        syscall

        jr $ra

error401: 
    la     $a0, Error401
        li     $v0, 4
        syscall

        jr $ra


error601: 
    la     $a0, Error601
        li     $v0, 4
        syscall

        jr $ra

error701: 
    la     $a0, Error701
        li     $v0, 4
        syscall

        jr $ra
        

updateID:
        lw    $t7, 4($a1)
        addi  $t7, $t7, -1
        sw    $t7, 4($a1)

        lw    $a1, 8($a1)

        bne   $a1, $a0, updateID

        jr    $ra



	# Codigo profesor
smalloc: 
        lw      $t7, slist
        beqz    $t7, sbrk
        move    $v0, $t7
        lw      $t7, 8($t7)
        sw      $t7, slist
        jr      $ra
sbrk:
        li      $a0, 16
        li      $v0, 9
        syscall
        jr $ra
sfree: 
        la      $t7, slist
        sw      $t7, 8($a0)
        sw      $a0, slist
        jr      $ra


exit:
      li $v0, 10
      syscall
