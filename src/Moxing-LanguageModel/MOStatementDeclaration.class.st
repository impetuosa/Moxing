Class {
	#name : #MOStatementDeclaration,
	#superclass : #MOStatement,
	#instVars : [
		'#declaration => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOStatementDeclaration >> declaration: aMOJavaClass [ 
	declaration := aMOJavaClass
]
