.data
fin: .asciiz "input.txt"
fout: .asciiz "output.txt"
str: .space 1000
arr: .space 1000
intarr: .space 4000
openbr: .asciiz  "["
closebr: .asciiz  "]"
comma: .asciiz  ","
sizeprint: .asciiz " size = "
maxi: .asciiz "maximum : "
ten: .asciiz "10"
ingloriousMIPS: .byte 1
newline: .asciiz "\r\n"

.text
shadow:				## it is main but I want to have some fun
add $t9, $zero, $zero

jal fileRead			## reading input.txt

add $t4, $zero, $zero
jal initAtoi			## atoi function

mainLoop:

la $a1, intarr 			## array adress
add $t1, $zero, $t9		## index1 
add $t2, $zero, $zero		## index2
add $t3, $zero, $zero		## index3
add $t4, $zero, $zero     	## size of sequence
add $s2, $zero, $zero		## maximum of size of sequences
jal loopOne			## outer loop 

jal maxSequence			## prints higher sequence to output.txt
lb $t8, intarr($t9)
bne $t8, 0, mainLoop

j endOfProgram			## program finishes

############### FILE READING #############

fileRead:
###### File opening for reading #######
addi $v0, $zero, 13		## system call for open file
la $a0, fin			## input file name
add $a1, $zero, $zero		## open for reading
add $a2, $zero, $zero		## mode is ignored 
syscall				## open a file (file descriptor returned in $v0)
move $s6, $v0			## save the file descriptor

###### Reading from file #######
addi $v0, $zero, 14		## system call for reading file
add $a0, $zero, $s6		## loading file descriptor for input.txt
la $a1, str			## storage adress for readed string
addi $a2, $zero, 1000		## max number of characters to read
syscall				## reading from file

###### Closing file #######
addi $v0, $zero, 16		## system call for closing file
add $a0, $zero, $s6		## loading file descriptor for input.txt
syscall				## closing the file

jr $ra				## GO BACK TO THE SHADOW

################## ATOI ##################

initAtoi:
add $t1, $zero, $zero
atoi:
lb $t0, str($t2)		## digit taking as character from string

beq $t0, 46, endAtoi		## end of the file is a dot. So when program reach the dot, atoi loop finishes
beq $t0, 33, toInitMarked	## end of one array is a exclamation mark. So when program reach it, array finishes 
beq $t0, 32, toInit		## whitespace, only neglect it and take the next character
slti $t3, $t0, 48		## digits are between 0 to 9, 
bne $t3, $zero, next		## but char representations in ASCII 48 to 57
slti $t3, $t0, 58		## in this lines
beq $t3, $zero, next		## program controls the element is digit or non-digit

addi $t0, $t0, -48		## converting char to integer

sll $t3, $t1, 3			## context of t1 * 8 
sll $t1, $t1, 1			## context of t1 * 2
add $t1, $t1, $t3		## t1 * 8 + t1 * 2 = t1 * 10 (these 3 lines for multiplication by 10)
add $t1, $t1, $t0		## connecting ones digit and upper digits
next:
addi $t2, $t2, 1		## increasing index to show next element (character array)
j atoi

toInitMarked:
addi $t1, $zero, -1		## program runs for positive integers starts by 0 so, to seperate arrays program store -1 between the arrays
toInit:
addi $t2, $t2, 1		## increasing index to show next element (character array)
sb $t1, intarr($t4)		## storing integer number that converted by atoi 
addi $t4, $t4, 4		## increasing index to reach next element (storage)
j initAtoi 

endAtoi:
addi $t1, $zero, -1		## program runs for positive integers starts by 0 so, to seperate arrays program store -1 between the arrays
sb $t1, intarr($t4)		## storing the finish element that it is -1
la $s5, intarr($t4)		## storing the address of end of the all arrays
jr $ra				## GO BACK TO THE SHADOW

############### OUTER LOOP ###############

loopOne:
addi $t2, $t1, 0		## index2 shows the same thing with index 1 as a milestone

############### MIDDLE LOOP ###############

loopTwo:

lb $s1, intarr($t1)		## loading present element to register
beq $s1, -1, exitLoopOne 
addi $s0, $s1, 0		## first element of the sequence is the biggest item (for now)
addi $t4, $zero, 1		## size of sequence is 1 at the first element of the sequence
addi $t2, $t2, 4		## index2 shows the next element after that point
addi $t3, $t2, 0		## index3 shows the same thing with index 2 as a milestone
lb $s1, intarr($t2)		## loading present element to register
beq $s1, -1, exitLoopTwo	## Middle loop reached the end of the array 
slt $v1, $s1, $s0		## comparison between max and present elements
bne $v1, $zero, loopTwo 	## if present element is not greater than max change present to next element

addi $v0, $zero, 4
la $a0, openbr
syscall

addi $v0, $zero, 1
add $a0, $zero, $s0
syscall

addi $s0, $s1, 0		## biggest element upgraded to its new value
addi $t4, $t4, 1		## size of sequence is get larger 

addi $v0, $zero, 4
la $a0, comma
syscall

addi $v0, $zero, 1
add $a0, $zero, $s0
syscall

############### INNER LOOP ###############

loopThree:
addi $t3, $t3, 4		## index3 shows the next element after that point
lb $s1, intarr($t3)		## loading present element to register
beq $s1, -1, exitLoopThree	## Inner loop reached the end of the array 
slt $v1, $s1, $s0		## comparison between max and present elements
bne $v1, $zero, loopThree	## if present element is not greater than max change present to next element
addi $s0, $s1, 0		## biggest element upgraded to its new value
addi $t4, $t4, 1		## size of sequence is get larger 

addi $v0, $zero, 4
la $a0, comma
syscall

addi $v0, $zero, 1
add $a0, $zero, $s0
syscall

j loopThree
exitLoopThree:

############### END OF THE INNER LOOP ###############

addi $v0, $zero, 4
la $a0, closebr
syscall

addi $v0, $zero, 4
la $a0, sizeprint
syscall

addi $v0, $zero, 1
add $a0, $zero, $t4
syscall

addi $a0, $0, 0xA		##ascii code for LF, if you have any trouble try 0xD for CR.
addi $v0, $0, 11 		##syscall 11 prints the lower 8 bits of $a0 as an ascii character.
syscall

slt $v1, $t4, $s2		## comparison between current sequence size and maximum sequence size
bne $v1, $zero, skip		## if maximum sequence bigger than current sequence skip the upgrading max values part
addi $s2, $t4, 0		## upgrading the maximum sequence size
addi $s3, $t1, 0		## upgrading the first index of maximum sequence
addi $s4, $t2, 0		## upgrading the second index of maximum sequence
skip:
lb $s1, intarr($t2)
beq $s1, -1, exitLoopTwo
j loopTwo
exitLoopTwo:

############### END OF THE MIDDLE LOOP ###############

addi $t1, $t1, 4		## index1 shows the next element one after present point
j loopOne
exitLoopOne: 
addi $t1, $t1, 4
add $t9, $zero, $t1
jr $ra				## GO BACK TO THE SHADOW

############### END OF THE OUTER LOOP ###############

################### MAX SEQUENCE ####################
maxSequence:

###### File opening for writing #######
addi $v0, $zero, 13		## system call for open file
la $a0, fout			## output file name
addi $a1, $zero, 1		## open for writing
add $a2, $zero, $zero		## mode is ignored 
syscall				## open a file (file descriptor returned in $v0)
move $s6, $v0			## save the file descriptor
##########################################

lb $s0, intarr($s3)

add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1, maxi
addi $a2, $zero, 10
syscall

add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1, openbr
addi $a2, $zero, 1
syscall

add $s7, $ra, $zero
jal printInteger
add $ra, $s7, $zero

lb $s0, intarr($s4)

add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1, comma
addi $a2, $zero, 1
syscall

add $s7, $ra, $zero
jal printInteger
add $ra, $s7, $zero

addi $t3, $s4, 0

lastLoop:
addi $t3, $t3, 4		## index3 shows the next element after that point
lb $s1, intarr($t3)		## loading present element to register
beq $s1, -1, exitLastLoop	## Inner loop reached the end of the array 
slt $v1, $s1, $s0		## comparison between max and present elements
bne $v1, $zero, lastLoop	## if present element is not greater than max change present to next element
addi $s0, $s1, 0		## biggest element upgraded to its new value

add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1, comma
addi $a2, $zero, 1
syscall

add $s7, $ra, $zero
jal printInteger
add $ra, $s7, $zero

j lastLoop

exitLastLoop:

add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1, closebr
addi $a2, $zero, 1
syscall

add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1, sizeprint
addi $a2, $zero, 8
syscall

beq $s2, 10, trick
addi $s2, $s2, 48
sb $s2, ingloriousMIPS

add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1, ingloriousMIPS
addi $a2, $zero, 1
syscall
j go

trick:
add $a0, $s6, $zero
la $a1, ten
addi $v0, $zero, 15
addi $a2, $zero, 2
syscall

go:
add $a0, $s6, $zero
addi $v0, $zero, 15
la $a1 , newline		##ascii code for LF, if you have any trouble try 0xD for CR.
addi $a2, $zero, 4
syscall

jr $ra				## GO BACK TO THE SHADOW

printInteger:
add $t6, $s0, $zero
addi $t2, $zero, 10
addi $t0, $zero, 1
divv:
div $t6, $t2
mflo $t6
beq $t6, $zero, inttochar
mul $t0, $t0, $t2
j divv

inttochar:
div $s0, $t0
mflo $t1
mfhi $t6
div $t0, $t2
mflo $t0

addi $t1, $t1, 48
sb $t1, ingloriousMIPS

add $a0, $s0, $zero
addi $v0, $zero, 15
la $a1, ingloriousMIPS
addi $a2, $zero, 1
syscall

bne $t6, $zero, inttochar
jr $ra				## GO BACK TO THE MAX SEQUENCE

endOfProgram:
###### Closing file #######
addi $v0, $zero, 16		## system call for closing file
add $a0, $zero, $s6		## loading file descriptor for output.txt
syscall				## closing the file
