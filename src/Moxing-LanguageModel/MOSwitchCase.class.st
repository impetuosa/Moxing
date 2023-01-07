Class {
	#name : #MOSwitchCase,
	#superclass : #MOStatement,
	#instVars : [
		'#block => MODeclaresSlot one',
		'#labels => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOSwitchCase >> acceptVisitor: aVisitor [

	^ aVisitor visitSwitchBlock: self
]

{ #category : #accessing }
MOSwitchCase >> block [

	^ block
]

{ #category : #accessing }
MOSwitchCase >> block: anObject [

	block := anObject
]

{ #category : #accessing }
MOSwitchCase >> labels [

	^ labels
]

{ #category : #accessing }
MOSwitchCase >> labels: anObject [

	labels := anObject
]
