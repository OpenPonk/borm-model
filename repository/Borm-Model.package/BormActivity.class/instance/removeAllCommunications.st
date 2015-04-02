removing
removeAllCommunications
	communications copy
		do: [ :each | 
			each sender removeCommunication: each.
			each receiver removeCommunication: each ]