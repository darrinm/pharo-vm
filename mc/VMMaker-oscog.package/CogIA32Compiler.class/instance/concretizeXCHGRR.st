generate machine code
concretizeXCHGRR
	| reg1 reg2 |
	reg1 := self concreteRegister: (operands at: 0).
	reg2 := self concreteRegister: (operands at: 1).
	reg2 = EAX ifTrue:
		[reg2 := reg1.
		 reg1 := EAX].
	reg1 = EAX ifTrue:
		[machineCode at: 0 put: 16r90 + reg2.
		 ^machineCodeSize := 1].
	machineCode
		at: 0 put: 16r87;
		at: 1 put: (self mod: ModReg RM: reg1 RO: reg2).
	^machineCodeSize := 2