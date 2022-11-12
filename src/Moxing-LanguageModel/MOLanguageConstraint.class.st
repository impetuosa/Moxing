Class {
	#name : #MOLanguageConstraint,
	#superclass : #Object,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOLanguageConstraint >> can: anObject declare: anOtherObject with: aSlot [

	^ anOtherObject isDeclaration or: [ anOtherObject isDeclarationUnit ]
]

{ #category : #testing }
MOLanguageConstraint >> can: anObject express: anOtherObject with: aSlot [

	^ anOtherObject isExpression
]

{ #category : #testing }
MOLanguageConstraint >> can: anObject refer: anOtherObject with: aSlot [

	^ anOtherObject isReference
]

{ #category : #testing }
MOLanguageConstraint >> can: aMOBlock state: aMOStatementExpression with: aMOStatesSlot [

	^ aMOStatementExpression isStatement
]

{ #category : #testing }
MOLanguageConstraint >> can: anObject useAsReferee: anOtherObject with: aSlot [

	^ anObject refersToObjectsLikeOrStonRef: anOtherObject
]
