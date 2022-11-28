Class {
	#name : #MOModelLabelWithStatementBuilder,
	#superclass : #MOModelLabelReferenceBuilder,
	#instVars : [
		'statement'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelLabelWithStatementBuilder >> buildsType [

	^ MOLabelWithStatement
]

{ #category : #accessing }
MOModelLabelWithStatementBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	statement := anEntity statement
]

{ #category : #accessing }
MOModelLabelWithStatementBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  label: self label;
		  statement: self statement;
		  yourself
]

{ #category : #accessing }
MOModelLabelWithStatementBuilder >> statement [

	^ statement
]

{ #category : #accessing }
MOModelLabelWithStatementBuilder >> statement: aMOWhile [ 
	statement := aMOWhile
]
