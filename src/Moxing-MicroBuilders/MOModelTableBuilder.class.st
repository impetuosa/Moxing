Class {
	#name : #MOModelTableBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'indexes'
	],
	#category : #'Moxing-MicroBuilders-types'
}

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
	self superclassReference: anEntity indexes
]

{ #category : #accessing }
MOModelTableBuilder >> privateBuild [

	^ super privateBuild
		  indexes: self indexes;
		  yourself
]
