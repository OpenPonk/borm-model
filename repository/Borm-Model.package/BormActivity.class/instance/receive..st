adding
receive: aCommunication
	(communications includes: aCommunication)
		ifTrue: [ ^ self ].
	aCommunication receiver: self.
	communications add: aCommunication.
	self changed