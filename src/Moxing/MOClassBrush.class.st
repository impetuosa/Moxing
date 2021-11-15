Class {
	#name : #MOClassBrush,
	#superclass : #MOCompositeBrush,
	#category : #'Moxing-Brushes'
}

{ #category : #'as yet unclassified' }
MOClassBrush class >> writesClass [
	^ true 
]

{ #category : #'as yet unclassified' }
MOClassBrush class >> writesType [
	^ true
]

{ #category : #writing }
MOClassBrush >> write: anEntity into: aWriter [
	| toWrite |
	self assert: policyTransformationMapping isEmpty.
	self assert: (anEntity isKindOf: MOClass).
	toWrite := aWriter instantiate: MOClass. 
	toWrite name: anEntity name. 
	toWrite visibility: anEntity visibility.
	toWrite modifiers: anEntity modifiers. 
	anEntity hierarchicalChildren do: [ :child | 
		aWriter
			useSurface: toWrite
			during: [ self delegateWritting: child into: aWriter ] ].
	aWriter writeClass: toWrite 
]
