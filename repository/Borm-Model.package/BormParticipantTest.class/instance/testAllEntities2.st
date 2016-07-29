tests
testAllEntities2
	emptyParticipant add: emptyState.
	self
		assert: emptyParticipant allEntities
		equals: (Set with: emptyParticipant entity with: emptyState entity)