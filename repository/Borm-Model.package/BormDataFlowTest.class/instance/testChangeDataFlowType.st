as yet unclassified
testChangeDataFlowType
	self assert: emptyDataFlow isInput.
	self deny: emptyDataFlow isOutput.
	emptyDataFlow beOutput.
	self deny: emptyDataFlow isInput.
	self assert: emptyDataFlow isOutput.
	emptyDataFlow beInput.
	self assert: emptyDataFlow isInput.
	self deny: emptyDataFlow isOutput