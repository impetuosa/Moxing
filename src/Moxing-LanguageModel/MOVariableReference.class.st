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
		nextPutAll: name
]

{ #category : #'as yet unclassified' }
MOVariableReference >> refersToObjectsLike: aMOAttribute [

	^ aMOAttribute isNil or: [ 
		  (aMOAttribute isKindOf: MOAbstractVariable) or: [ 
			  { 
				  MOAlceForm.
				  MOAlceReport } includes: aMOAttribute species ] ]
]

{ #category : #generated }
MOVariableReference >> type [
	^ candidate type 
]
