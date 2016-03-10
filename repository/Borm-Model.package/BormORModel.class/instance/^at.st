accessing
@ aFqn
	^ (aFqn includesSubstring: '::')
		ifTrue: [ self nodeNamed: aFqn ]
		ifFalse: [ self participantNamed: aFqn ]