Class {
	#name : #MONewExpression,
	#superclass : #MOInvocation,
	#instVars : [
		'typeReference'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MONewExpression >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitNewExpression: self .
]

{ #category : #'as yet unclassified' }
MONewExpression >> dependencies [
	^ typeReference dependencies 
]

{ #category : #'as yet unclassified' }
MONewExpression >> printOn: aStream [

	aStream
		nextPutAll: 'CALL NEW ';
		nextPutAll: typeReference name;
		nextPutAll: '\';
		nextPutAll:
			(arguments ifNil: [ 0 ] ifNotNil: [ :a | a size ]) asString
]

{ #category : #'as yet unclassified' }
MONewExpression >> typeReference [
	^ typeReference
]

{ #category : #'as yet unclassified' }
MONewExpression >> typeReference: aMOTypescriptImportedTypeReference [
	typeReference := aMOTypescriptImportedTypeReference
]
