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

	^ name
]

{ #category : #printing }
MOPrimitiveType >> printOn: aStream [

	aStream
		nextPutAll: 'primitive: ';
		nextPutAll: name
]
