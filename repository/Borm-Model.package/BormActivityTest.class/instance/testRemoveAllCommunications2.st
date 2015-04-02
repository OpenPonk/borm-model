tests
testRemoveAllCommunications2
	receiver removeAllCommunications.
	self assert: sender sent isEmpty.
	self assert: receiver received isEmpty