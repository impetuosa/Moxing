Class {
	#name : #MOAlceFileLineInput,
	#superclass : #MOStatement,
	#instVars : [
		'#fileDescriptorReference => MOReferenceSlot one',
		'#inputReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceFileLineInput >> acceptVisitor: aVisitor [

	^ aVisitor visitFileLineInput: self
]

{ #category : #accessing }
MOAlceFileLineInput >> fileDescriptorReference [

	^ fileDescriptorReference
]

{ #category : #accessing }
MOAlceFileLineInput >> fileDescriptorReference: anObject [

	fileDescriptorReference := anObject
]

{ #category : #accessing }
MOAlceFileLineInput >> inputReference [

	^ inputReference
]

{ #category : #accessing }
MOAlceFileLineInput >> inputReference: anObject [

	inputReference := anObject
]
