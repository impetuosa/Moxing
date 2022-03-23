Class {
	#name : #MOAlceResume,
	#superclass : #MOStatement,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceResume >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [ 
	^ aMOModelWriteTypeBasedCopyResolver visitResume: self 
]

{ #category : #printing }
MOAlceResume >> printOn: aStream [

	aStream nextPutAll: #resume
]
