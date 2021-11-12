Class {
	#name : #MOModelWriter,
	#superclass : #Object,
	#instVars : [
		'destinationModel',
		'surface',
		'brush',
		'replace'
	],
	#category : #'Moxing-Java-Writer'
}

{ #category : #accessing }
MOModelWriter >> brush: aMOMethodBrush [

	brush := aMOMethodBrush
]

{ #category : #'as yet unclassified' }
MOModelWriter >> instantiate: aClass forReplacing: aMOFunction [

	| entity |
	replace at: aMOFunction ifPresent: [ self error: ' eunexpected ' ].
	entity := destinationModel instantiate: aClass.
	replace at: aMOFunction put: entity.
	^ entity
]

{ #category : #accessing }
MOModelWriter >> model: aMOModel [ 
	destinationModel := aMOModel 
]

{ #category : #accessing }
MOModelWriter >> surface: aMOClass [

	surface := aMOClass
]

{ #category : #writing }
MOModelWriter >> write: aMOFunction with: aMOModelDerivative [

	replace := Dictionary new.
	^ brush write: aMOFunction into: self
]
