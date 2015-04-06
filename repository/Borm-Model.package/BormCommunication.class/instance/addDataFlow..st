adding
addDataFlow: aDataFlow
	(dataFlows includes: aDataFlow)
		ifTrue: [ ^ self ].
	dataFlows add: aDataFlow.
	aDataFlow addedTo: self.
	self announceAdded: aDataFlow