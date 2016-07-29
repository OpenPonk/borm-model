tests
testAllEntities2
	emptyModel add: emptyParticipant.
	self
		assert: emptyModel allEntities
		equals: (Set with: emptyModel entity with: emptyParticipant entity)