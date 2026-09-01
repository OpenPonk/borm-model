"
I am a specific BORM simulation condition indicating that NONE of the specified neighbor transitions should be active or fulfilled.
"
Class {
	#name : 'BormNodeNoneNeighborSimulationCondition',
	#superclass : 'BormNodeSimulationCondition',
	#category : 'OpenPonk-BormModel-Models',
	#package : 'OpenPonk-BormModel',
	#tag : 'Models'
}

{ #category : 'hooks' }
BormNodeNoneNeighborSimulationCondition >> nameAsOutput [ 
	^ 'None'
]
