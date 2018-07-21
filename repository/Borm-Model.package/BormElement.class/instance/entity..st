accessing
entity: anEntity
	entity := SRToOneLink
		on: self
		slot: #entity
		oppositeSlot: #representations
		updateFrom: entity
		to: anEntity