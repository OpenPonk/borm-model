adding
send: aCommunication
	(communications includes: aCommunication)
		ifTrue: [ ^ self ].
	aCommunication sender: self.
	communications add: aCommunication.
	aCommunication addedTo: self.
	self announceAdded: aCommunication