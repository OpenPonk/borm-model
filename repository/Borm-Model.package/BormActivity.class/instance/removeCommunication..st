adding
removeCommunication: aCommunication
	communications remove: aCommunication.
	aCommunication sender = self
		ifTrue: [ 
			aCommunication removedFrom: self.
			self announceRemoved: aCommunication ]