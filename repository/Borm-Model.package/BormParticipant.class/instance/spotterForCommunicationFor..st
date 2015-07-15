gt-spotter
spotterForCommunicationFor: aStep
	<spotterOrder: 5>
	^ aStep listProcessor
		title: 'Incoming communications';
		allCandidates: [ (self nodes select: [ :each | each isKindOf: BormActivity ] thenCollect: [ :each | each received ]) flattened
 ]