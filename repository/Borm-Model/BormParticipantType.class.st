"
I represent the possible types for a participant.

See the class side for the listing.
"
Class {
	#name : #BormParticipantType,
	#superclass : #Object,
	#category : 'Borm-Model-Models'
}

{ #category : #enumeration }
BormParticipantType class >> Organization [
	^ #Organization
]

{ #category : #enumeration }
BormParticipantType class >> Person [
	^ #Person
]

{ #category : #enumeration }
BormParticipantType class >> System [
	^ #System
]
