tests
testRemoveAllTransitionsFromTarget
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	target removeAllTransitions.
	self assert: source outgoing size equals: 0.
	self assert: target incoming size equals: 0