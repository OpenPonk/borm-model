tests
testAddParticipant
	emptyModel when: OPElementAdded do: [ :event | eventTriggered := true ].
	emptyModel add: emptyParticipant.
	self assert: emptyModel participants size equals: 1.
	self assert: emptyParticipant owner equals: emptyModel.
	self assert: eventTriggered