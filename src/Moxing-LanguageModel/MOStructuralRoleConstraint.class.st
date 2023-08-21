"
I represent a set of language semantic constraints establishing if each specific relation between two objects is or not correct. 
I base my behaviour by testing the structural reality of the referenced object.

"
Class {
	#name : #MOStructuralRoleConstraint,
	#superclass : #MOLanguageConstraint,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject beDescribedBy: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as property to an other object using a specific slot'>
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
	<doc: 'Responds if an object can be linked as declaration to an other object using a specific slot'>
	^ anOtherObject isDeclaration or: [ anOtherObject isDeclarationUnit ]
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject express: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as expression to an other object using a specific slot'>
	^ anOtherObject isExpression
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject refer: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as refer to an other object using a specific slot'>
	^ anOtherObject isReference
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: aMOBlock state: aMOStatementExpression with: aMOStatesSlot [
	<doc: 'Responds if an object can be linked as states to an other object using a specific slot'>
	^ aMOStatementExpression isStatement
]

{ #category : #testing }
MOStructuralRoleConstraint >> can: anObject useAsReferee: anOtherObject with: aSlot [

	<doc:
	'Responds if an object can be linked as referee to an other object using a specific slot'>
	^ anObject refersToObjectsLikeOrStonRef: anOtherObject
]
