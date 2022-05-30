Class {
	#name : #MOAlceFileRename,
	#superclass : #MOStatement,
	#instVars : [
		'#newNameReference => MOReferenceSlot one',
		'#oldNameReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOAlceFileRename >> newNameReference [

	^ newNameReference
]

{ #category : #accessing }
MOAlceFileRename >> newNameReference: anObject [

	newNameReference := anObject
]

{ #category : #accessing }
MOAlceFileRename >> oldNameReference [

	^ oldNameReference
]

{ #category : #accessing }
MOAlceFileRename >> oldNameReference: anObject [

	oldNameReference := anObject
]
