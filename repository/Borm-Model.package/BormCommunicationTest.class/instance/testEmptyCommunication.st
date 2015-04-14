tests
testEmptyCommunication
	self assert: emptyCommunication dataFlows isEmpty.
	self assert: emptyCommunication constraint name equals: ''