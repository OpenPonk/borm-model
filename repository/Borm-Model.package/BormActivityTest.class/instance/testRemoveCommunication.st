tests
testRemoveCommunication
	self assert: sender sent size equals: 1.
	self assert: receiver received size equals: 1.
	sender removeCommunication: communication.
	receiver removeCommunication: communication.
	self assert: sender sent isEmpty.
	self assert: receiver sent isEmpty.