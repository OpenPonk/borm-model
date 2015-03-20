tests
testEmptyProcessNode
	self assert: emptyNode incoming isEmpty.
	self assert: emptyNode outgoing isEmpty.
	self deny: emptyNode isSubdiagramNode