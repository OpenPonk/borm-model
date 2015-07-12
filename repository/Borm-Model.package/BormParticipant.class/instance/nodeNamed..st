accessing
nodeNamed: aName
	^ self nodes detect: [ :each | each name = aName ]