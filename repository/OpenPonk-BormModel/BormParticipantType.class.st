"
I provide constant identifiers for the types of participants in a BORM model (e.g., `Person`, `Organization`, `System`).
"
Class {
	#name : 'BormParticipantType',
	#superclass : 'Object',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'enumeration' }
BormParticipantType class >> Organization [
	^ #Organization
]

{ #category : 'enumeration' }
BormParticipantType class >> Person [
	^ #Person
]

{ #category : 'enumeration' }
BormParticipantType class >> System [
	^ #System
]
