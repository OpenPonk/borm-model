tests
testRemoveParticipant
	emptyDiagram add: emptyParticipant.
	emptyDiagram remove: emptyParticipant.
	self assert: emptyDiagram participants size equals: 0