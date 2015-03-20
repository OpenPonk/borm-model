tests
testDefaultDataFlow
	self assert: emptyDataFlow isInput.
	self deny: emptyDataFlow isOutput