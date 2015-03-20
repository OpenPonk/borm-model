testing - instance creation
transitionFrom: aSourceNode to: aTargetNode
	| aTransition |
	(aTransition := self emptyTransition) from: aSourceNode to: aTargetNode.
	aSourceNode addTransition: aTransition.
	aTargetNode addTransition: aTransition.
	^ aTransition