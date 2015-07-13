removing
removedFrom: anActivity
	super removedFrom: anActivity do: [ self removeAllDataFlows ]