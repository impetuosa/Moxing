Class {
	#name : #MOComment,
	#superclass : #MOStatement,
	#instVars : [
		'#statement => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOComment >> acceptVisitor: aVisitor [
  ^aVisitor visitComment: self
]

{ #category : #accessing }
MOComment >> shouldPopulateRelations [

	^ false
]

{ #category : #accessing }
MOComment >> statement [
	^ statement
]

{ #category : #accessing }
MOComment >> statement: aMOReturn [ 
	statement := aMOReturn
]
