Class {
	#name : #MOModelCommentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'statement'
	],
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelCommentBuilder >> buildsType [
  ^MOComment
]

{ #category : #accessing }
MOModelCommentBuilder >> loadBuilderWithEntity: anEntity [
  self statement: anEntity statement
]

{ #category : #accessing }
MOModelCommentBuilder >> privateBuild [
  ^(self instantiate: self buildsType)
     statement: self statement;
     yourself
]

{ #category : #accessing }
MOModelCommentBuilder >> statement [
	^ statement
]

{ #category : #generated }
MOModelCommentBuilder >> statement: aMOReturn [
  statement := aMOReturn
]
