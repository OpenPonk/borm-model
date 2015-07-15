gt-inspector
gtModelOn: aComposite
	<gtInspectorPresentationOrder: 30>
	aComposite table
		title: 'Details';
		display: [ { 
			'Name' -> self name.
			'Type' -> self type.
			'Role' -> self role.
			 } ];
		column: 'Detail' evaluated: #key;
		column: 'Value' evaluated: #value