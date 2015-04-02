tests
testRemoveAll
	emptyDiagram add: self fullParticipant.
	emptyDiagram removeAll.
	self assert: emptyDiagram participants size equals: 0