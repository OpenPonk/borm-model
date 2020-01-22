"
State represents a state of execution in which the participant currently is.

Also the state can be regular (default), initial, final,  or both.
"
Class {
	#name : #BormState,
	#superclass : #BormProcessNode,
	#instVars : [
		'isInitial',
		'isFinal'
	],
	#category : #'OpenPonk-BormModel-Models'
}

{ #category : #accessing }
BormState >> beFinal [
	self isFinal: true
]

{ #category : #accessing }
BormState >> beInitial [
	self isInitial: true
]

{ #category : #'gt-inspector' }
BormState >> gtInspectorPresentation: composite [
	<gtInspectorPresentationOrder: 30>
	composite table
		title: 'Transitions';
		display: [ transitions ]
]

{ #category : #initialization }
BormState >> initialize [
	super initialize.
	isInitial := false.
	isFinal := false
]

{ #category : #accessing }
BormState >> isFinal [
	^ isFinal
]

{ #category : #accessing }
BormState >> isFinal: aBoolean [
	isFinal := aBoolean.
	self changed
]

{ #category : #accessing }
BormState >> isInitial [
	^ isInitial
]

{ #category : #accessing }
BormState >> isInitial: aBoolean [
	isInitial := aBoolean.
	self changed
]

{ #category : #accessing }
BormState >> isState [
	^ true
]

{ #category : #removing }
BormState >> removedFrom: aParticipant [
	super removedFrom: aParticipant do: [ self removeAllTransitions ]
]
