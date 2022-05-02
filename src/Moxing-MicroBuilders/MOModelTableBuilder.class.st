Class {
	#name : #MOModelTableBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'indexes',
		'relations'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #generated }
MOModelTableBuilder >> addExpression: anExpression [

	self relations add: anExpression
]

{ #category : #accessing }
MOModelTableBuilder >> buildsType [

	^ MOAlceTable
]

{ #category : #accessing }
MOModelTableBuilder >> indexes [

	^ indexes ifNil: [ indexes := OrderedCollection new ]
]

{ #category : #generated }
MOModelTableBuilder >> indexes: aCollection [

	indexes := aCollection
]

{ #category : #accessing }
MOModelTableBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self relations: anEntity relations.
	self indexes: anEntity indexes
]

{ #category : #accessing }
MOModelTableBuilder >> privateBuild [

	^ super privateBuild
		  indexes: self indexes;
		  relations: self relations;
		  yourself
]

{ #category : #generated }
MOModelTableBuilder >> relations [

	^ relations ifNil: [ relations := OrderedCollection new ]
]

{ #category : #accessing }
MOModelTableBuilder >> relations: si [

	relations := si
]
