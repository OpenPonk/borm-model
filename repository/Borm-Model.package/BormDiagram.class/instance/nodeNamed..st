accessing
nodeNamed: aString
	| aName participant |
	aName := aString splitOn: '::'.
	participant := self participants detect: [ :each | each name = aName first ].
	^ participant nodes detect: [ :each | each name = aName second ]