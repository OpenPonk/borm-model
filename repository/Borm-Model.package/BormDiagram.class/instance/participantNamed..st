accessing
participantNamed: aString
	^ self participants detect: [ :each | each name = aString ]