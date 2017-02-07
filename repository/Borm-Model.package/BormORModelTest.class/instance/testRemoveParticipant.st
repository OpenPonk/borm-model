tests
testRemoveParticipant
	emptyModel when: OPElementRemoved do: [ :event | eventTriggered := true ].
	emptyModel add: emptyParticipant.
	emptyModel remove: emptyParticipant.
	self assert: emptyModel participants size equals: 0.
	self assert: eventTriggered