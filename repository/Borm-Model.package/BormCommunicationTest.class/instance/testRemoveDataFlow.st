tests
testRemoveDataFlow
	emptyCommunication addDataFlow: emptyDataFlow.
	emptyCommunication removeDataFlow: emptyDataFlow.
	self assert: emptyCommunication dataFlows isEmpty