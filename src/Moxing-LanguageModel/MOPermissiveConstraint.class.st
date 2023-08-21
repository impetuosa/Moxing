"
I represent a set of language semantic constraints establishing if each specific relation between two objects is or not correct. 
I admit any relation. 
"
Class {
	#name : #MOPermissiveConstraint,
	#superclass : #MOLanguageConstraint,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOPermissiveConstraint >> can: anObject beDescribedBy: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as property to an other object using a specific slot'>
	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject beParentedBy: anOtherObject with: aSlot [

	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject declare: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as declaration to an other object using a specific slot'>
	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject express: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as expression to an other object using a specific slot'>
	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject refer: anOtherObject with: aSlot [

	<doc:
	'Responds if an object can be linked as refer to an other object using a specific slot'>
	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: aMOBlock state: aMOStatementExpression with: aMOStatesSlot [
	<doc: 'Responds if an object can be linked as states to an other object using a specific slot'>
	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject useAsReferee: anOtherObject with: aSlot [

	<doc:
	'Responds if an object can be linked as referee to an other object using a specific slot'>
	^ true
]
