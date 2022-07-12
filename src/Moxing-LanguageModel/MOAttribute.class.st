Class {
	#name : #MOAttribute,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'#visibility => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAttribute >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitAttribute: self
]

{ #category : #'as yet unclassified' }
MOAttribute >> canBeReferredAsAttribute [

	^ true
]

{ #category : #'as yet unclassified' }
MOAttribute >> canBeReferredAsPrimitiveType [

	^self  name == #Null
]

{ #category : #'as yet unclassified' }
MOAttribute >> canBeReferredAsVariable [

	^ self isDynamicBinding
]

{ #category : #'as yet unclassified' }
MOAttribute >> kindString [

	^ 'ATTR'
]

{ #category : #accessing }
MOAttribute >> object [

	^ self parent object state at: name
]

{ #category : #accessing }
MOAttribute >> printOn: aStream [

	aStream
		nextPutAll: parent name;
		nextPutAll: '>>'.
	super printOn: aStream
]

{ #category : #'as yet unclassified' }
MOAttribute >> visibility [
	^ visibility
]

{ #category : #'as yet unclassified' }
MOAttribute >> visibility: aString [
	visibility := aString
]
