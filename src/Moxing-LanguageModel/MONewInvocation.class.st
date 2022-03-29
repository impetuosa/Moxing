Class {
	#name : #MONewInvocation,
	#superclass : #MOInvocation,
	#instVars : [
		'#typeReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #'as yet unclassified' }
MONewInvocation >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	^ aJinTypescriptCodeGenerator visitNewExpression: self .
]

{ #category : #'as yet unclassified' }
MONewInvocation >> dependencies [
	^ typeReference dependencies 
]

{ #category : #initialization }
MONewInvocation >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #'as yet unclassified' }
MONewInvocation >> printOn: aStream [

	aStream
		nextPutAll: 'CALL NEW ';
		nextPutAll: typeReference name;
		nextPutAll: '\';
		nextPutAll:
			(arguments ifNil: [ 0 ] ifNotNil: [ :a | a size ]) asString
]

{ #category : #'as yet unclassified' }
MONewInvocation >> refersToObjectsLike: aMOClassProcedure [

	^ aMOClassProcedure canBeReferredAsConstructor
]

{ #category : #'as yet unclassified' }
MONewInvocation >> typeReference [
	^ typeReference
]

{ #category : #'as yet unclassified' }
MONewInvocation >> typeReference: aMOTypescriptImportedTypeReference [
	typeReference := aMOTypescriptImportedTypeReference
]
