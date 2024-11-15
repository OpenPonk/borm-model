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
					with: [ spec repository: 'github://openponk/openponk-model:v4.1.x' ];
				baseline: 'OpenPonkSynchronizedLinks'
					with: [ spec repository: 'github://openponk/synchronized-links:v4.1.x' ].
			spec
				package: 'OpenPonk-BormModel'
				with: [ spec requires: #('OpenPonkModel' 'OpenPonkSynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-BormModel') ]
]
