instance creation
communicationFrom: fromActivity to: toActivity
	| comm |
	comm := BormCommunication from: fromActivity to: toActivity.
	fromActivity send: comm.
	toActivity receive: comm.
	^ comm