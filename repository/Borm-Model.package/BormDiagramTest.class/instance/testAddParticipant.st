tests
testAddParticipant
	emptyDiagram when: DCElementAdded do: [ :event | eventTriggered := true ].
	emptyDiagram add: emptyParticipant.
	self assert: emptyDiagram participants size equals: 1.
	self assert: emptyParticipant owner equals: emptyDiagram.
	self assert: eventTriggered