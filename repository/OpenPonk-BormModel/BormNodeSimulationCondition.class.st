Class {
	#name : 'BormNodeSimulationCondition',
	#superclass : 'Object',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'comparing' }
BormNodeSimulationCondition >> = other [

	^ self class = other class
]

{ #category : 'comparing' }
BormNodeSimulationCondition >> hash [

	^ self class hash
]

{ #category : 'hooks' }
BormNodeSimulationCondition >> nameAsInput [

	^ self nameAsOutput
]

{ #category : 'hooks' }
BormNodeSimulationCondition >> nameAsOutput [

	^ self subclassResponsibility
]
