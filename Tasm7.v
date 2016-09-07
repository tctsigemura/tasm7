_stdin
	WS	1
_stdout
	WS	1
_stderr
	WS	1
__alcAddr
	WS	1
_errno
	WS	1
_sourcefp
	WS	1
_binaryfp
	WS	1
_listfp
	WS	1
_ch
	WS	1
_nextch
	WS	1
_token
	WS	1
_dc
	WS	1
_ds
	WS	1
.L1
	STRING	"使用方法 : %s [-h] [<source file>]\n"
.L2
	STRING	"    <source file> is assembly source file\n"
.L3
	STRING	"    assemble result will be shown Tasm.list \n"
.L4
	STRING	"\n"
.L5
	STRING	"    -h : show this message\n"
.L6
	STRING	"\n"
.usage
	ENTRY	0
	LDP	1
	ARG
	LDC	.L1
	ARG
	LDG	_stderr
	ARG
	CALLF	3,_fprintf
	POP
	LDC	.L2
	ARG
	LDG	_stderr
	ARG
	CALLF	2,_fprintf
	POP
	LDC	.L3
	ARG
	LDG	_stderr
	ARG
	CALLF	2,_fprintf
	POP
	LDC	.L4
	ARG
	LDG	_stderr
	ARG
	CALLF	2,_fprintf
	POP
	LDC	.L5
	ARG
	LDG	_stderr
	ARG
	CALLF	2,_fprintf
	POP
	LDC	.L6
	ARG
	LDG	_stderr
	ARG
	CALLF	2,_fprintf
	POP
	RET
.L7
	STRING	"引数が足りていません"
.L8
	STRING	"-h"
.L9
	STRING	"r"
.L10
	STRING	"引数が多すぎます"
_main
	ENTRY	1
	LDC	1
	STL	1
	POP
	LDP	1
	LDL	1
	EQ
	JF	.L11
	LDC	.L7
	ARG
	CALLP	1,_error
	LDC	65524
	ARG
	CALLP	1,_exit
	LDC	65535
	MREG
	JMP	.L12
.L11
	LDP	1
	LDL	1
	GT
	JF	.L13
	LDC	.L8
	ARG
	LDP	2
	LDL	1
	LDW
	ARG
	CALLF	2,_strCmp
	LDC	0
	EQ
	JF	.L13
	LDP	2
	LDC	0
	LDW
	ARG
	CALLP	1,.usage
	LDC	0
	MREG
	JMP	.L12
.L13
	LDL	1
	LDC	1
	ADD
	LDP	1
	EQ
	JF	.L14
	LDC	.L9
	ARG
	LDP	2
	LDL	1
	LDW
	ARG
	CALLF	2,_fopen
	STG	_sourcefp
	POP
	LDG	_sourcefp
	LDC	0
	EQ
	JF	.L15
	LDP	2
	LDL	1
	LDW
	ARG
	CALLP	1,_perror
.L15
.L14
	LDP	1
	LDC	2
	GT
	JF	.L16
	LDC	.L10
	ARG
	CALLP	1,_error
	LDC	65535
	MREG
	JMP	.L12
.L16
	LDC	0
	STG	_token
	POP
	CALLP	0,_Initialization
.L17
	CALLF	0,_pass1
	JF	.L18
	JMP	.L17
.L18
	LDG	_sourcefp
	ARG
	CALLF	1,_fclose
	POP
	LDG	_dc
	ARG
	CALLP	1,_free
	LDG	_ds
	ARG
	CALLP	1,_free
	LDC	0
	MREG
.L12
	RET
