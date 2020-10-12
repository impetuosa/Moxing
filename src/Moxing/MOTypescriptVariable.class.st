Class {
	#name : #MOTypescriptVariable,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'type',
		'class',
		'visibility',
		'defaultValue'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #accessing }
MOTypescriptVariable >> acceptVisitor: aJinTypescriptCodeGenerator [
	aJinTypescriptCodeGenerator visitTypescriptVariable: self
]

{ #category : #'as yet unclassified' }
MOTypescriptVariable >> defaultValue: aMOTypescriptLiteral [
	defaultValue := aMOTypescriptLiteral
]

{ #category : #accessing }
MOTypescriptVariable >> printOn: aStream [
	aStream
		nextPutAll: 'VD:';
		nextPutAll: name;
		nextPutAll: '(';
		nextPutAll: type name;
		nextPutAll: ')'
]

{ #category : #accessing }
MOTypescriptVariable >> setOwnerClass: aClassObject [ 
	class := aClassObject 
]

{ #category : #accessing }
MOTypescriptVariable >> type [
	^ type
]

{ #category : #accessing }
MOTypescriptVariable >> type: aJinTypescriptTypeReference [ 
	type := aJinTypescriptTypeReference
]

{ #category : #'as yet unclassified' }
MOTypescriptVariable >> visibility: aString [
	visibility := aString
]
