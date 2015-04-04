adding
addDataFlow: aDataFlow
	dataFlows add: aDataFlow.
	aDataFlow addedTo: self.
	self announceAdded: aDataFlow