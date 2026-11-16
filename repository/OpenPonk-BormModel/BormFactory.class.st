"
Utility factory for BORM models providing high-level shortcuts for creating transitions and communications.
"
Class {
	#name : 'BormFactory',
	#superclass : 'Object',
	#category : 'OpenPonk-BormModel-Factory',
	#package : 'OpenPonk-BormModel',
	#tag : 'Factory'
}

{ #category : 'instance creation' }
BormFactory class >> addFqnTransitions: aCollection in: aParticipant [
	aCollection do: [ :pair | self fqnTransitionFrom: pair key to: pair value in: aParticipant ]
]

{ #category : 'instance creation' }
BormFactory class >> communicationFrom: fromActivity to: toActivity [
	| comm |
	comm := BormCommunication from: fromActivity to: toActivity.
	fromActivity send: comm.
	toActivity receive: comm.
	^ comm
]

{ #category : 'instance creation' }
BormFactory class >> fqnTransitionFrom: fromName to: toName in: aParticipant [
	^ self transitionFrom: aParticipant @ fromName to: aParticipant @ toName
]

{ #category : 'instance creation' }
BormFactory class >> transitionFrom: fromNode to: toNode [
	| transition |
	transition := BormTransition from: fromNode to: toNode.
	fromNode addTransition: transition.
	toNode addTransition: transition.
	^ transition
]
