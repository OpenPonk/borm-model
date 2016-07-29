tests
testAllEntities3
	emptyCommunication constraint: emptyConstraint.
	self
		assert: emptyCommunication allEntities
		equals: (Set with: emptyCommunication entity with: emptyConstraint entity)