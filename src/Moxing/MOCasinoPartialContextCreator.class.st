Class {
	#name : #MOCasinoPartialContextCreator,
	#superclass : #Object,
	#instVars : [
		'model',
		'context'
	],
	#category : #'Moxing-CasinoBinding'
}

{ #category : #'as yet unclassified' }
MOCasinoPartialContextCreator >> errors [
	^ {}
]

{ #category : #'as yet unclassified' }
MOCasinoPartialContextCreator >> load: aContext into: aModel [
 	context := aContext.
	model := aModel. 
	
	context acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
MOCasinoPartialContextCreator >> visitAngularModule: aMOAngularModule [ 
	" "
]
