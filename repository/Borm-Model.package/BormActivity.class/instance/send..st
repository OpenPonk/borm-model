adding
send: aCommunication
	aCommunication sender: self.
	communications add: aCommunication.
	aCommunication addedTo: self.
	self announceAdded: aCommunication