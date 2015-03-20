as yet unclassified
testBigParticipant
	| person |
	person := self fullParticipant.
	self assert: person nodes size equals: 5