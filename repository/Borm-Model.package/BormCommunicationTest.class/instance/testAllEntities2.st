tests
testAllEntities2
	emptyCommunication addDataFlow: emptyDataFlow.
	self
		assert: emptyCommunication allEntities
		equals: (Set with: emptyCommunication entity with: emptyDataFlow entity)