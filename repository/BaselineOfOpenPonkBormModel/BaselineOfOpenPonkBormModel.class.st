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
					with: [ spec repository: 'github://openponk/openponk-model' ];
				baseline: 'SynchronizedLinks'
					with: [ spec repository: 'github://openponk/synchronized-links' ].
			spec
				package: 'OpenPonk-BormModel'
				with: [ spec requires: #('OpenPonkModel' 'SynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-BormModel') ]
]
