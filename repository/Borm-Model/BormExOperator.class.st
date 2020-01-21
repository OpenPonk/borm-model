"
Operator lists all possible types of a Clause. See class-side for listing.
"
Class {
	#name : #BormExOperator,
	#superclass : #Object,
	#category : 'Borm-Model-Conditions'
}

{ #category : #enumeration }
BormExOperator class >> All [
	^ #All
]

{ #category : #enumeration }
BormExOperator class >> Any [
	^ #Any
]

{ #category : #enumeration }
BormExOperator class >> One [
	^ #One
]
