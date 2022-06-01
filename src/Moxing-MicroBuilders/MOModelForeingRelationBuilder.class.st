Class {
	#name : #MOModelForeingRelationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'fromTable',
		'toTable',
		'matches',
		'tableFrom',
		'tableTo'
	],
	#category : #'Moxing-MicroBuilders-expressions'
}

{ #category : #asserting }
MOModelForeingRelationBuilder >> buildsType [

	^ MOForeignRelation
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> loadBuilderWithEntity: anEntity [

	self tableFrom: anEntity tableFrom.
	self tableTo: anEntity tableTo.
	self matches: anEntity matches
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> matches [

	^ matches ifNil: [ matches := OrderedCollection new ]
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> matches: aCol [

	matches := aCol
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  tableFrom: self tableFrom;
		  tableTo: self tableTo;
		  matches: self matches;
		  yourself
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> tableFrom [

 	 ^ tableFrom
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> tableFrom: tf [

	tableFrom := tf
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> tableTo [

	^ tableTo
]

{ #category : #asserting }
MOModelForeingRelationBuilder >> tableTo: tf [

	tableTo := tf
]
