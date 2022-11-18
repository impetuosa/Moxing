Class {
	#name : #MOAlceFileLineInput,
	#superclass : #MOStatement,
	#instVars : [
		'#fileDescriptorReference => MORefersSlot one',
		'#inputReference => MORefersSlot one'
	],
	#category : #'Moxing-Access-Statements'
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
