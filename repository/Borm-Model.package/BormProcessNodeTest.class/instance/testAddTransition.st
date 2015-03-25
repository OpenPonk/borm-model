tests
testAddTransition
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := emptyTransition.
	transition source: source.
	transition target: target.
	source addTransition: transition.
	target addTransition: transition.
	self assert: source outgoing size equals: 1.
	self assert: source outgoing anyOne equals: transition.
	self assert: target incoming size equals: 1.
	self assert: target incoming anyOne equals: transition.
	self assert: transition source equals: source.
	self assert: transition target equals: target