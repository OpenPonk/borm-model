"
Metacello baseline for the OpenPonk BORM model definitions, managing package dependencies and load configurations.
"
Class {
	#name : 'BaselineOfOpenPonkBormModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkBormModel',
	#package : 'BaselineOfOpenPonkBormModel'
}

{ #category : 'baselines' }
BaselineOfOpenPonkBormModel >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
					with: [ spec repository: 'github://openponk/openponk-model:v5.0.1' ];
				baseline: 'OpenPonkSynchronizedLinks'
					with: [ spec repository: 'github://openponk/synchronized-links:v5.0.1' ].
			spec
				package: 'OpenPonk-BormModel'
				with: [ spec requires: #('OpenPonkModel' 'OpenPonkSynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-BormModel') ]
]
