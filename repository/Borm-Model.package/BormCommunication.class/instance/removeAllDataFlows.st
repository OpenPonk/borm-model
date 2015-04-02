removing
removeAllDataFlows
	dataFlows copy do: [ :each | self removeDataFlow: each ]