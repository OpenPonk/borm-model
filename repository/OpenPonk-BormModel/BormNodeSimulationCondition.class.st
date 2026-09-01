"
I am the abstract base class for simulation conditions applied to BORM nodes. I define how a node evaluates its input or output neighbors during process simulation.
"
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
