"
I am a specific BORM simulation condition indicating that ANY (at least one) of the specified neighbor transitions must be fulfilled for the node to proceed.
"
Class {
	#name : 'BormNodeAnyNeighborSimulationCondition',
	#superclass : 'BormNodeSimulationCondition',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'hooks' }
BormNodeAnyNeighborSimulationCondition >> nameAsOutput [

	^ 'Any'
]
