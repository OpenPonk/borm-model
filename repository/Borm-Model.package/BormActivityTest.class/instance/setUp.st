running
setUp
	super setUp.
	sender := BormActivity new.
	receiver := BormActivity new.
	communication := BormCommunication new.
	sender send: communication.
	receiver receive: communication