Class {
	#name : #MOForeignRelationMatch,
	#superclass : #MOExpression,
	#instVars : [
		'#primaryKey => MORefersSlot one',
		'#foreignKey => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOForeignRelationMatch >> acceptVisitor: aMOElementToUIString [

	^ aMOElementToUIString visitForeignRelationMatch: self
]

{ #category : #accessing }
MOForeignRelationMatch >> childrenForTree [

	^ { 
		  primaryKey.
		  foreignKey }
]

{ #category : #accessing }
MOForeignRelationMatch >> foreignKey [
	^ foreignKey
]

{ #category : #accessing }
MOForeignRelationMatch >> foreignKey: aMOAttributeAccess [ 
	foreignKey := aMOAttributeAccess
]

{ #category : #accessing }
MOForeignRelationMatch >> isReference [

	^ true
]

{ #category : #accessing }
MOForeignRelationMatch >> primaryKey [
	^ primaryKey
]

{ #category : #accessing }
MOForeignRelationMatch >> primaryKey: aMOAttributeAccess [ 
	primaryKey := aMOAttributeAccess
]
