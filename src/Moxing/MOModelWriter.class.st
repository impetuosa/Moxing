Class {
	#name : #MOModelWriter,
	#superclass : #Object,
	#instVars : [
		'destinationModel',
		'surface',
		'brush',
		'replace',
		'transformations',
		'derivativeModel'
	],
	#category : #Moxing
}

{ #category : #accessing }
MOModelWriter >> brush: aMOMethodBrush [

	brush := aMOMethodBrush
]

{ #category : #'instance creation' }
MOModelWriter >> instantiate: aClass [ 
	^ destinationModel instantiate: aClass
]

{ #category : #'as yet unclassified' }
MOModelWriter >> instantiate: aClass forReplacing: aMOFunction [

	| entity |
	replace at: aMOFunction ifPresent: [ self error: ' eunexpected ' ].
	entity := derivativeModel instantiate: aClass.
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

{ #category : #'as yet unclassified' }
MOModelWriter >> swap: aMOExit with: aMOReturnEmpty context: aMOBlock [

	derivativeModel swap: aMOExit with: aMOReturnEmpty context: aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelWriter >> useSurface: aMOClass during: aFullBlockClosure [

	| previousSurface |
	previousSurface := surface.
	surface := aMOClass.
	^ aFullBlockClosure ensure: [ surface := previousSurface ]
]

{ #category : #writing }
MOModelWriter >> write: aMOFunction [
	self assert: destinationModel isNotNil.
	self assert: replace isNotNil.
	^ brush write: aMOFunction into: self
]

{ #category : #writing }
MOModelWriter >> write: aMOFunction with: aMOModelDerivative [

	replace := Dictionary new.
	derivativeModel := aMOModelDerivative.
	^ brush write: aMOFunction into: self
]

{ #category : #writing }
MOModelWriter >> writeClass: aMOClass [

	aMOClass language: surface language.
	surface addType: aMOClass.
	aMOClass parent: surface. 
]

{ #category : #writing }
MOModelWriter >> writeMethod: aMOMethod [

	aMOMethod language: surface language.
	surface addMethod: aMOMethod.
	aMOMethod parent: surface
]
