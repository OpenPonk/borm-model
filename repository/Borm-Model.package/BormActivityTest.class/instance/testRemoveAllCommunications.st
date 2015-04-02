tests
testRemoveAllCommunications
	sender removeAllCommunications.
	self assert: sender sent isEmpty.
	self assert: receiver received isEmpty