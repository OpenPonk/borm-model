instance creation
transitionFrom: fromNode to: toNode
	| transition |
	transition := BormTransition from: fromNode to: toNode.
	fromNode addTransition: transition.
	toNode addTransition: transition.
	^ transition