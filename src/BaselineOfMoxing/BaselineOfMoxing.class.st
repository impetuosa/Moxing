Class {
	#name : #BaselineOfMoxing,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoxing
}

{ #category : #baselines }
BaselineOfMoxing >> baseline: spec [

	<baseline>
	spec
		baseline: 'SmaCC'
		with: [ spec repository: 'github://impetuosa/SmaCC' ].
	spec baseline: 'XMLParserHTML' with: [ 
		spec repository:
			'github://pharo-contributions/XML-XMLParserHTML:1.6.0/src' ].

	spec
		package: 'Moxing'
		with: [ spec requires: #( SmaCC XMLParserHTML ) ].
	spec package: 'Moxing-Java' with: [ spec requires: #( Moxing ) ].
	spec
		package: 'Moxing-Typescript'
		with: [ spec requires: #( Moxing ) ].
	spec
		package: 'Moxing-Angular'
		with: [ spec requires: #( Moxing 'Moxing-Typescript' ) ].
	spec
		group: 'default'
		with: #( Moxing 'Moxing-Java' 'Moxing-Typescript'
			   'Moxing-Angular' )
]
