Class {
	#name : 'BaselineOfBormModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBormModel',
	#package : 'BaselineOfBormModel'
}

{ #category : 'baselines' }
BaselineOfBormModel >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkModel'
					with: [ spec repository: 'github://openponk/openponk-model:v4.0.x' ];
				baseline: 'SynchronizedLinks'
					with: [ spec repository: 'github://openponk/synchronized-links:v4.0.x' ].
			spec
				package: 'OpenPonk-BormModel'
				with: [ spec requires: #('OpenPonkModel' 'SynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-BormModel') ]
]
