"
I represent a conceptual semantic entity in a BORM model. I track all my structural and visual representations across different diagrams or model elements.
"
Class {
	#name : 'BormEntity',
	#superclass : 'OPModelObject',
	#instVars : [
		'representations'
	],
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'accessing' }
BormEntity >> addRepresentation: anElement [
	self representations add: anElement
]

{ #category : 'initialization' }
BormEntity >> initialize [
	super initialize.
	representations := SRToManyLink on: self slot: #representations oppositeSlot: #entity
]

{ #category : 'accessing' }
BormEntity >> name [

	super name ifNotNil: [ :entityName | entityName ifNotEmpty: [ ^ entityName ] ].
	^ self representations value ifEmpty: [ '' ] ifNotEmpty: [ :linkedElements | linkedElements first name ]
]

{ #category : 'accessing' }
BormEntity >> removeRepresentation: anElement [
	self representations remove: anElement
]

{ #category : 'accessing' }
BormEntity >> representations [
	^ representations
]
