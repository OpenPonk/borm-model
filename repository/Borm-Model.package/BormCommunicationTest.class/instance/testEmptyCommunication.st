tests
testEmptyCommunication
	self assert: emptyCommunication dataFlows isEmpty.
	self assert: emptyCommunication constraint equals: nil