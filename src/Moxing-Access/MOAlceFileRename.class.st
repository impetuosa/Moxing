Class {
	#name : #MOAlceFileRename,
	#superclass : #MOStatement,
	#instVars : [
		'#newNameReference => MORefersSlot one',
		'#oldNameReference => MORefersSlot one'
	],
	#category : #'Moxing-Access-Statements'
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
