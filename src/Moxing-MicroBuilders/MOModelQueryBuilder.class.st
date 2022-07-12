Class {
	#name : #MOModelQueryBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'sql',
		'expressions'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOModelQueryBuilder >> addExpression: aMOAttributeAccess [

	self expressions add: aMOAttributeAccess
]

{ #category : #accessing }
MOModelQueryBuilder >> buildsType [ 

	^ MOAlceQuery
]

{ #category : #accessing }
MOModelQueryBuilder >> expressions [

	^ expressions ifNil: [ OrderedCollection new ]
]

{ #category : #accessing }
MOModelQueryBuilder >> expressions: aCol [
 	 expressions := aCol 
]

{ #category : #accessing }
MOModelQueryBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self sql: anEntity sql.
	self expressions: anEntity expressions
]

{ #category : #accessing }
MOModelQueryBuilder >> privateBuild [

	^ super privateBuild
		  sql: self sql;
		  expressions: self expressions;
		  yourself
]

{ #category : #accessing }
MOModelQueryBuilder >> sql [

	^ sql
]

{ #category : #accessing }
MOModelQueryBuilder >> sql: aString [

	sql := aString
]
