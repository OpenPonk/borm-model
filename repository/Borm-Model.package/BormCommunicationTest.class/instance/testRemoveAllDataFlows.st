tests
testRemoveAllDataFlows
	emptyCommunication addDataFlow: emptyDataFlow.
	emptyCommunication removeAllDataFlows.
	self assert: emptyCommunication dataFlows isEmpty