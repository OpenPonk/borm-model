instance creation
transitionFrom: fromNode to: toNode
	| transition |
	transition := BormTransition from: fromNode to: toNode.
	fromNode send: transition.
	toNode receive: transition.
	^ transition