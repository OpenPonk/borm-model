tests
testChangeType
	emptyParticipant type: BormParticipantType Organization.
	self assert: emptyParticipant type equals: BormParticipantType Organization.
	emptyParticipant type: BormParticipantType System.
	self assert: emptyParticipant type equals: BormParticipantType System.
	emptyParticipant type: BormParticipantType Person.
	self assert: emptyParticipant type equals: BormParticipantType Person