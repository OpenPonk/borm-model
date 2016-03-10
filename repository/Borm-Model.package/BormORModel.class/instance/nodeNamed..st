accessing
nodeNamed: aString
	| aName |
	aName := aString splitOn: '::'.
	^ (self participantNamed: aName first) @ aName second