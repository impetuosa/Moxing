Class {
	#name : #MOInvocableStatement,
	#superclass : #MOStatement,
	#instVars : [
		'#parameters => MODeclaresSlot many',
		'#block => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOInvocableStatement >> block [
	^ block
]

{ #category : #accessing }
MOInvocableStatement >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #accessing }
MOInvocableStatement >> parameters [
	^ parameters
]

{ #category : #accessing }
MOInvocableStatement >> parameters: anUndefinedObject [ 
	parameters := anUndefinedObject
]
