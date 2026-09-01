"
I am a specific BORM simulation condition indicating that ALL specified neighbor transitions must be fulfilled for the node to proceed.
"
Class {
	#name : 'BormNodeAllNeighborSimulationCondition',
	#superclass : 'BormNodeSimulationCondition',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'hooks' }
BormNodeAllNeighborSimulationCondition >> nameAsOutput [

	^ 'All'
]
