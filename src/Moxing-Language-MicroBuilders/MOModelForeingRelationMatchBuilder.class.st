Class {
	#name : #MOModelForeingRelationMatchBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'primaryKey',
		'foreignKey'
	],
	#category : #'Moxing-Language-MicroBuilders-expressions'
}

{ #category : #'as yet unclassified' }
MOModelForeingRelationMatchBuilder >> buildsType [

	^ MOForeignRelationMatch
]

{ #category : #accessing }
MOModelForeingRelationMatchBuilder >> foreignKey [
	^ foreignKey
]

{ #category : #accessing }
MOModelForeingRelationMatchBuilder >> foreignKey: afk [

	foreignKey := afk
]

{ #category : #accessing }
MOModelForeingRelationMatchBuilder >> loadBuilderWithEntity: anEntity [

	self primaryKey: anEntity primaryKey.
	self foreignKey: anEntity foreignKey
]

{ #category : #accessing }
MOModelForeingRelationMatchBuilder >> primaryKey [
	^ primaryKey
]

{ #category : #accessing }
MOModelForeingRelationMatchBuilder >> primaryKey: apk [

	primaryKey := apk
]

{ #category : #accessing }
MOModelForeingRelationMatchBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  primaryKey: self primaryKey;
		  foreignKey: self foreignKey;
		  yourself
]
