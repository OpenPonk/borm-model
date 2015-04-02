removing
removedFrom: aDiagram
	super removedFrom: aDiagram do: [ self removeAllNodes ]