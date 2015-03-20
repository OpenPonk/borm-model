tests
testCommunication
	self assert: communication sender equals: sender.
	self assert: communication receiver equals: receiver.
	self assert: sender sent size equals: 1.
	self assert: sender sent first equals: communication.
	self assert: receiver received size equals: 1.
	self assert: receiver received first equals: communication