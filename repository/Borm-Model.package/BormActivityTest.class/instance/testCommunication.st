tests
testCommunication
	self assert: communication sender equals: sender.
	self assert: communication receiver equals: receiver.
	self assert: communication owner equals: sender.
	self assert: sender sent size equals: 1.
	self assert: sender sent anyOne equals: communication.
	self assert: receiver received size equals: 1.
	self assert: receiver received anyOne equals: communication