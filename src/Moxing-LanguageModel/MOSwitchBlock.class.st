Class {
	#name : #MOSwitchBlock,
	#superclass : #MOStatement,
	#instVars : [
		'#label => MOExpressesSlot one',
		'#block => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOSwitchBlock >> acceptVisitor: aVisitor [

	^ aVisitor visitSwitchBlock: self
]

{ #category : #accessing }
MOSwitchBlock >> block [

	^ block
]

{ #category : #accessing }
MOSwitchBlock >> block: anObject [

	block := anObject
]

{ #category : #accessing }
MOSwitchBlock >> label [

	^ label
]

{ #category : #accessing }
MOSwitchBlock >> label: anObject [

	label := anObject
]
