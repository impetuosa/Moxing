Class {
	#name : #MOStructuralRoleConstraint,
	#superclass : #MOLanguageConstraint,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject beDescribedBy: anOtherObject with: aSlot [

	^ true
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject beParentedBy: anOtherObject with: aSlot [

	^ anOtherObject isNil or: [ 
		  (anOtherObject isKindOf: MOModel) or: [ 
			  anOtherObject isKindOf: MOObject ] ]
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject declare: anOtherObject with: aSlot [

	^ anOtherObject isDeclaration or: [ anOtherObject isDeclarationUnit ]
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject express: anOtherObject with: aSlot [

	^ anOtherObject isExpression
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject refer: anOtherObject with: aSlot [

	^ anOtherObject isReference
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: aMOBlock state: aMOStatementExpression with: aMOStatesSlot [

	^ aMOStatementExpression isStatement
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject useAsReferee: anOtherObject with: aSlot [

	^ anObject refersToObjectsLikeOrStonRef: anOtherObject
]
