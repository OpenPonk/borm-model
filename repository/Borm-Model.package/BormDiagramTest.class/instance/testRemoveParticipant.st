tests
testRemoveParticipant
	emptyDiagram when: DCElementRemoved do: [ :event | eventTriggered := true ].
	emptyDiagram add: emptyParticipant.
	emptyDiagram remove: emptyParticipant.
	self assert: emptyDiagram participants size equals: 0.
	self assert: eventTriggered