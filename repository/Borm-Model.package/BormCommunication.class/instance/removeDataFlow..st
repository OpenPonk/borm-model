removing
removeDataFlow: aDataFlow
	dataFlows remove: aDataFlow.
	aDataFlow removedFrom: self.
	self announceRemoved: aDataFlow