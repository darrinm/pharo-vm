debug printing
printMemField: memField name: name size: length
	<var: #memField type: #usqInt>
	<var: #name type: #'char *'>
	self print: name; tab; printHexPtr: memField;
		printChar: $/; printNum: (self oopForPointer: memField);
		print: ' sz: '; printHex: length.
	length ~= 0 ifTrue:
		[self printChar: $/; printNum: length].
	self cr