Class {
	#name : #MOForeignRelationMatch,
	#superclass : #MOExpression,
	#instVars : [
		'#primaryKey => MOReferenceSlot one',
		'#foreignKey => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOForeignRelationMatch >> foreignKey: aMOAttributeAccess [ 
	foreignKey := aMOAttributeAccess
]

{ #category : #accessing }
MOForeignRelationMatch >> isReference [

	^ true
]

{ #category : #accessing }
MOForeignRelationMatch >> primaryKey: aMOAttributeAccess [ 
	primaryKey := aMOAttributeAccess
]
