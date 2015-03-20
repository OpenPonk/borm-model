tests
testRemoveNodes
	emptyParticipant add: emptyState.
	emptyParticipant add: emptyActivity.
	self assert: emptyParticipant nodes size equals: 2.
	emptyParticipant remove: emptyState.
	self assert: emptyParticipant nodes size equals: 1.
	self assert: emptyState owner equals: nil.
	emptyParticipant remove: emptyActivity.
	self assert: emptyParticipant nodes size equals: 0.
	self assert: emptyActivity owner equals: nil