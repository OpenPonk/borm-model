adding
add: anElement
	(elements includes: anElement)
		ifTrue: [ ^ self ].
	elements add: anElement.
	anElement addedTo: self.
	self announce: (OPElementAdded element: anElement).
	self changed