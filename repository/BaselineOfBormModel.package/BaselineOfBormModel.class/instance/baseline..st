accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
					with: [ spec repository: 'github://openponk/openponk-model/repository' ];
				project: 'Fame'
					with: [ spec
						className: #ConfigurationOfFame;
						versionString: #development;
						repository: 'http://www.smalltalkhub.com/mc/Moose/Fame/main' ].
			spec package: 'Borm-Model' with: [ spec requires: #('OpenPonkModel' 'Fame') ].
			spec group: 'default' with: #('Borm-Model') ]