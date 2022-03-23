Class {
	#name : #MOAlias,
	#superclass : #MOPrimitiveType,
	#instVars : [
		'#typeReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAlias >> acceptVisitor: ads [

	^ ads visitAlias: self
]

{ #category : #accessing }
MOAlias >> allMethods [

	^ typeReference candidate allMethods
]

{ #category : #accessing }
MOAlias >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: ' AliasOf (';
		nextPutAll: typeReference name;
		nextPutAll: ')'
]

{ #category : #accessing }
MOAlias >> typeReference: aMOPrimitiveTypeReference [ 
	typeReference := aMOPrimitiveTypeReference
]
