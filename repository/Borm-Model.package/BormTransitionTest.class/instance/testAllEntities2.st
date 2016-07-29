tests
testAllEntities2
	emptyTransition constraint: emptyConstraint.
	self
		assert: emptyTransition allEntities
		equals: (Set with: emptyTransition entity with: emptyConstraint entity)