Class {
	#name : #MOReplacedStatement,
	#superclass : #MOComment,
	#instVars : [
		'#newStatement => MOContainmentSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOReplacedStatement >> acceptVisitor: aVisitor [

	^ aVisitor visitReplacedStatement: self
]

{ #category : #accessing }
MOReplacedStatement >> anchor [

	^ statement anchor
]

{ #category : #accessing }
MOReplacedStatement >> newStatement [

	^ newStatement
]
