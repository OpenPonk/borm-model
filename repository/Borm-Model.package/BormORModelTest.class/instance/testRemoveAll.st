tests
testRemoveAll
	emptyModel add: self fullParticipant.
	emptyModel removeAll.
	self assert: emptyModel participants size equals: 0