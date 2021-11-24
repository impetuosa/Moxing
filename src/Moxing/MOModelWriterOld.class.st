Class {
	#name : #MOModelWriterOld,
	#superclass : #Object,
	#instVars : [
		'destinationModel',
		'surface',
		'brush',
		'replace',
		'derivativeModel'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOModelWriterOld >> brush: aMOMethodBrush [

	brush := aMOMethodBrush
]

{ #category : #'instance creation' }
MOModelWriterOld >> instantiate: aClass [ 
	^ destinationModel instantiate: aClass
]

{ #category : #'as yet unclassified' }
MOModelWriterOld >> instantiate: aClass forReplacing: aMOFunction [

	| entity |
	replace at: aMOFunction ifPresent: [ self error: ' eunexpected ' ].
	entity := derivativeModel instantiate: aClass.
	replace at: aMOFunction put: entity.
	^ entity
]

{ #category : #accessing }
MOModelWriterOld >> model: aMOModel [ 
	destinationModel := aMOModel 
]

{ #category : #accessing }
MOModelWriterOld >> surface: aMOClass [

	surface := aMOClass
]

{ #category : #'as yet unclassified' }
MOModelWriterOld >> swap: aMOExit with: aMOReturnEmpty context: aMOBlock [

	derivativeModel swap: aMOExit with: aMOReturnEmpty context: aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelWriterOld >> useSurface: aMOClass during: aFullBlockClosure [

	| previousSurface |
	previousSurface := surface.
	surface := aMOClass.
	^ aFullBlockClosure ensure: [ surface := previousSurface ]
]

{ #category : #writing }
MOModelWriterOld >> write: aMOFunction [
	self assert: destinationModel isNotNil.
	self assert: replace isNotNil.
	^ brush write: aMOFunction into: self
]

{ #category : #writing }
MOModelWriterOld >> write: aMOFunction with: aMOModelDerivative [

	replace := Dictionary new.
	derivativeModel := aMOModelDerivative.
	^ brush write: aMOFunction into: self
]

{ #category : #writing }
MOModelWriterOld >> writeClass: aMOClass [

	aMOClass language: surface language.
	surface addType: aMOClass.
	aMOClass parent: surface. 
]

{ #category : #writing }
MOModelWriterOld >> writeMethod: aMOMethod [

	aMOMethod language: surface language.
	surface addMethod: aMOMethod.
	aMOMethod parent: surface
]
