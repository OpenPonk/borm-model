accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
					with: [ spec repository: 'github://openponk/openponk-model/repository' ];
				baseline: 'SynchronizedLinks'
					with: [ spec repository: 'github://openponk/synchronized-links/repository' ].
			spec
				package: 'Borm-Model'
				with: [ spec requires: #('OpenPonkModel' 'SynchronizedLinks') ].
			spec group: 'default' with: #('Borm-Model') ]