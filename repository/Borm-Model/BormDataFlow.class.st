"
Data flow is an optional data package sent through communication channel from one activity to another.

The sender can send ""input"" (default) data flows (from the receivers perspective), while the receiver can answer with ""output"" data flows.
"
Class {
	#name : #BormDataFlow,
	#superclass : #BormElement,
	#instVars : [
		'type'
	],
	#category : 'Borm-Model-Models'
}

{ #category : #enumeration }
BormDataFlow class >> inputType [
	^ #input
]

{ #category : #enumeration }
BormDataFlow class >> outputType [
	^ #output
]

{ #category : #accessing }
BormDataFlow >> allEntities [
	^ Set with: self entity
]

{ #category : #accessing }
BormDataFlow >> beInput [
	^ type := self class inputType
]

{ #category : #accessing }
BormDataFlow >> beOutput [
	type := self class outputType
]

{ #category : #initialization }
BormDataFlow >> initialize [
	super initialize.
	self beInput
]

{ #category : #testing }
BormDataFlow >> isInput [
	^ type = self class inputType
]

{ #category : #testing }
BormDataFlow >> isOutput [
	^ type = self class outputType
]

{ #category : #accessing }
BormDataFlow >> type [
	^ type
]

{ #category : #accessing }
BormDataFlow >> type: aType [
	type := aType.
	self changed
]
