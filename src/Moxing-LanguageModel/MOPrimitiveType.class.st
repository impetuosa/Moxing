Class {
	#name : #MOPrimitiveType,
	#superclass : #MOType,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #printing }
MOPrimitiveType >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitPrimitiveType: self
]

{ #category : #printing }
MOPrimitiveType >> canBeReferredAsPrimitiveType [

	^ true
]

{ #category : #printing }
MOPrimitiveType >> fullName [

	^ self name
]

{ #category : #printing }
MOPrimitiveType >> isDefinedInLibrary [

	^ true
]

{ #category : #printing }
MOPrimitiveType >> isPrimitiveType [ 

	^ true
]

{ #category : #printing }
MOPrimitiveType >> printOn: aStream [

	aStream
		nextPutAll: 'primitive: ';
		nextPutAll:self  name
]

{ #category : #printing }
MOPrimitiveType >> producesParseableCode [

	^ false
]
