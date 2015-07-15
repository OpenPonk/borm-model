gt-spotter
spotterForModelFor: aStep
	<spotterOrder: 5>
	^ aStep listProcessor
		title: 'Borm Participants';
		allCandidates: [ self participants ];
		itemName: #name;
		filter: GTFilterSubstring