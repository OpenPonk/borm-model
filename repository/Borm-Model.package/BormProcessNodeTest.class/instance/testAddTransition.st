tests
testAddTransition
	| source target transition |
	source := emptyState.
	target := emptyActivity.
	transition := self transitionFrom: source to: target.
	self assert: source outgoing size equals: 1.
	self assert: source outgoing anyOne equals: transition.
	self assert: target incoming size equals: 1.
	self assert: target incoming anyOne equals: transition.
	self assert: transition owner equals: source.
	self assert: transition source equals: source.
	self assert: transition target equals: target