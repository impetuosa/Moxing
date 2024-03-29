Class {
	#name : #BaselineOfMoxing,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoxing
}

{ #category : #baselines }
BaselineOfMoxing >> access: spec [

	spec
		package: 'Moxing-Access'
		with: [ spec requires: #( Moxing 'Jindao' ) ]
]

{ #category : #baselines }
BaselineOfMoxing >> angular: spec [

	spec
		package: 'Moxing-Angular'
		with: [ spec requires: #( Moxing 'Moxing-Typescript' ) ]
]

{ #category : #baselines }
BaselineOfMoxing >> angularjs: spec [

	spec
		package: 'Moxing-AngularJS'
		with: [ spec requires: #( Moxing 'Moxing-Typescript' ) ]
]

{ #category : #baselines }
BaselineOfMoxing >> base: spec [

	spec
		package: 'Moxing'
		with: [ spec requires: #( SmaCC XMLParserHTML ) ].
	spec
		package: 'Moxing-LanguageModel'
		with: [ spec requires: #( Moxing 'Moxing-Language-MicroBuilders'  'Moxing-Language-MicroWriters') ].
	spec
		package: 'Moxing-Language-MicroBuilders'
		with: [ spec requires: #( Moxing ) ].
	spec
		package: 'Moxing-Language-MicroWriters'
		with: [ spec requires: #( 'Moxing-Language-MicroBuilders' ) ]
]

{ #category : #baselines }
BaselineOfMoxing >> baseline: spec [

	<baseline>
	self dependencies: spec.

	self base: spec.
	self access: spec. 
	self java: spec.
	self typescript: spec.
	self angular: spec.
	self angularjs: spec.
	
	self smalltalk: spec. 
	self pharo: spec.
	self visualWorks: spec.
	
	self default: spec
]

{ #category : #baselines }
BaselineOfMoxing >> default: spec [

	spec
		group: 'default'
		with: #( Moxing 'Moxing-Access' 'Moxing-Java' 'Moxing-Typescript'
		   'Moxing-Angular'  'Moxing-StPharo' 'Moxing-StVisualWorks' 'Moxing-AngularJS')
]

{ #category : #baselines }
BaselineOfMoxing >> dependencies: spec [

	spec
		baseline: 'SmaCC'
		with: [ spec repository: 'github://impetuosa/SmaCC' ].
	spec baseline: 'XMLParserHTML' with: [ 
		spec repository:
			'github://pharo-contributions/XML-XMLParserHTML:1.6.0/src' ].
	spec
		baseline: 'Jindao'
		with: [ spec repository: 'github://impetuosa/Jindao' ]
]

{ #category : #baselines }
BaselineOfMoxing >> java: spec [
	spec package: 'Moxing-Java' with: [ spec requires: #( Moxing 'Moxing-LanguageModel' ) ].
	
]

{ #category : #baselines }
BaselineOfMoxing >> pharo: spec [

	spec
		package: 'Moxing-StPharo'
		with: [ spec requires: #( 'Moxing-Smalltalk' ) ]
]

{ #category : #baselines }
BaselineOfMoxing >> smalltalk: spec [

	spec
		package: 'Moxing-Smalltalk'
		with: [ spec requires: #( Moxing 'Moxing-LanguageModel' ) ]
]

{ #category : #baselines }
BaselineOfMoxing >> typescript: spec [

	spec
		package: 'Moxing-Typescript'
		with: [ spec requires: #( Moxing 'Moxing-LanguageModel'  ) ]
]

{ #category : #baselines }
BaselineOfMoxing >> visualWorks: spec [

	spec
		package: 'Moxing-StVisualWorks'
		with: [ spec requires: #( 'Moxing-Smalltalk' ) ]
]
