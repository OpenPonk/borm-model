"
I provide constant identifiers (`All`, `Any`, `One`) representing the possible logical operators for clauses within a BORM boolean expression tree.
"
Class {
	#name : 'BormExOperator',
	#superclass : 'Object',
	#category : 'OpenPonk-BormModel-Conditions',
	#package : 'OpenPonk-BormModel',
	#tag : 'Conditions'
}

{ #category : 'enumeration' }
BormExOperator class >> All [
	^ #All
]

{ #category : 'enumeration' }
BormExOperator class >> Any [
	^ #Any
]

{ #category : 'enumeration' }
BormExOperator class >> One [
	^ #One
]
