tests
testAddNodes
	self assert: emptyParticipant nodes size equals: 0.
	emptyParticipant add: emptyState.
	self assert: emptyParticipant nodes size equals: 1.
	self assert: emptyParticipant nodes first equals: emptyState.
	self assert: emptyState owner equals: emptyParticipant.
	emptyParticipant add: emptyActivity.
	self assert: emptyParticipant nodes size equals: 2.
	self assert: emptyParticipant nodes second equals: emptyActivity.
	self assert: emptyActivity owner equals: emptyParticipant