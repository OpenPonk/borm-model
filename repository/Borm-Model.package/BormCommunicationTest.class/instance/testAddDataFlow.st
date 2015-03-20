tests
testAddDataFlow
	emptyCommunication addDataFlow: emptyDataFlow.
	self assert: emptyCommunication dataFlows size equals: 1