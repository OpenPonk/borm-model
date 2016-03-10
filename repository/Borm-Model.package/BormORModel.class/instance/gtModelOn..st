gt-inspector
gtModelOn: aComposite
	<gtInspectorPresentationOrder: 30>
	aComposite table
		title: 'Participants';
		display: [ self participants ];
		column: 'Name' evaluated: [ :each | each name ] width: 100;
		column: 'Type' evaluated: [ :each | each type ] width: 80;
		column: 'Number of nodes' evaluated: [ :each | each nodes size ]