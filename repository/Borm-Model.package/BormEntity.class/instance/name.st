accessing
name
	super name ifNotEmpty: [ :n | ^ n ].
	^ self representations value ifEmpty: [ '' ] ifNotEmpty: [ :r | r first name ]