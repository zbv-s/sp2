.text
.globl main
main:
	pushl $len
	pushl $msg
	pushl $1
	call write
	addl $12,%esp
	ret
.data
	msg: .ascii "hello, world!\n"
	len = . - msg
