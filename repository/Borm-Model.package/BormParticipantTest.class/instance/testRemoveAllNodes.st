tests
testRemoveAllNodes
	| participant |
	participant := self fullParticipant.
	self assert: participant nodes size equals: 5.
	participant removeAllNodes.
	self assert: participant nodes isEmpty