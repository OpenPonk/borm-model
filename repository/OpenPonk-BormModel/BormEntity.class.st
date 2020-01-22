Class {
	#name : #BormEntity,
	#superclass : #OPModelObject,
	#instVars : [
		'representations'
	],
	#category : #'OpenPonk-BormModel-Models'
}

{ #category : #accessing }
BormEntity >> addRepresentation: anElement [
	self representations add: anElement
]

{ #category : #'as yet unclassified' }
BormEntity >> initialize [
	super initialize.
	representations := SRToManyLink on: self slot: #representations oppositeSlot: #entity
]

{ #category : #accessing }
BormEntity >> name [
	super name ifNotEmpty: [ :n | ^ n ].
	^ self representations value ifEmpty: [ '' ] ifNotEmpty: [ :r | r first name ]
]

{ #category : #accessing }
BormEntity >> removeRepresentation: anElement [
	self representations remove: anElement
]

{ #category : #accessing }
BormEntity >> representations [
	^ representations
]

{ #category : #accessing }
BormEntity >> representations: aCollection [
	representations values: aCollection
]
