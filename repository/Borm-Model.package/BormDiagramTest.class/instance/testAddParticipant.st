tests
testAddParticipant
	emptyDiagram add: emptyParticipant.
	self assert: emptyDiagram participants size equals: 1.
	self assert: emptyParticipant owner equals: emptyDiagram