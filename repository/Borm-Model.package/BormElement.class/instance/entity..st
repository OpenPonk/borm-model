accessing
entity: anEntity
	entity := FMMultivalueLink
		on: self
		update: #representations
		from: entity
		to: anEntity