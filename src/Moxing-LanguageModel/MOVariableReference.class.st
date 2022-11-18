Class {
	#name : #MOVariableReference,
	#superclass : #MOTypedReference,
	#instVars : [
		'#kind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #visiting }
MOVariableReference >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitVariableReference: self
]

{ #category : #accessing }
MOVariableReference >> kind: aString [

	kind := aString
]

{ #category : #generated }
MOVariableReference >> printOn: aStream [

	aStream
		nextPutAll: '->';
		nextPutAll:self  name
]

{ #category : #'as yet unclassified' }
MOVariableReference >> refersToObjectsLike: aMOAttribute [

	^ aMOAttribute canBeReferredAsVariable
]

{ #category : #generated }
MOVariableReference >> type [
	^ referee type 
]
