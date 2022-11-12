Class {
	#name : #MOAlceFileOpen,
	#superclass : #MOStatement,
	#instVars : [
		'#fileDescriptorReference => MORefersSlot one',
		'#filePathReference => MORefersSlot one',
		'#kind => MOPropertySlot'
	],
	#category : #'Moxing-Access-Statements'
}

{ #category : #visiting }
MOAlceFileOpen >> acceptVisitor: aVisitor [

	^ aVisitor visitFileOpen: self
]

{ #category : #accessing }
MOAlceFileOpen >> fileDescriptorReference [

	^ fileDescriptorReference
]

{ #category : #accessing }
MOAlceFileOpen >> fileDescriptorReference: aMOVariableReference [ 
	fileDescriptorReference := aMOVariableReference
]

{ #category : #accessing }
MOAlceFileOpen >> filePathReference [

	^ filePathReference
]

{ #category : #accessing }
MOAlceFileOpen >> filePathReference: aMOVariableReference [ 
	filePathReference := aMOVariableReference
]

{ #category : #accessing }
MOAlceFileOpen >> kind [

	^ kind
]

{ #category : #accessing }
MOAlceFileOpen >> kind: anObject [

	kind := anObject
]
