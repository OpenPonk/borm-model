tests
testRemoveTransition
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := emptyTransition.
	transition source: source.
	transition target: target.
	source addTransition: transition.
	target addTransition: transition.
	source removeTransition: transition.
	target removeTransition: transition.
	self assert: source outgoing size equals: 0.
	self assert: target incoming size equals: 0