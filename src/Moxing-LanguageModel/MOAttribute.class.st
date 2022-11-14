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

{ #category : #testing }
MOAttribute >> canBeReferredAsType [

	^ true
]

{ #category : #'as yet unclassified' }
MOAttribute >> canBeReferredAsVariable [

	^ self isDynamicBinding
]

{ #category : #accessing }
MOAttribute >> isPrimaryKey [

	^ parent isTable and: [ parent isPrimaryKey: self ]
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
		nextPutAll: (parent ifNotNil: [ :p | p name ] ifNil: [ 'None' ]);
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
