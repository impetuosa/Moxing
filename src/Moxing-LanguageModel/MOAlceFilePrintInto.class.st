Class {
	#name : #MOAlceFilePrintInto,
	#superclass : #MOStatement,
	#instVars : [
		'#fileDescriptorReference => MORefersSlot one',
		'#printingReferences => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceFilePrintInto >> acceptVisitor: aVisitor [

	^ aVisitor visitFilePrintInto: self
]

{ #category : #accessing }
MOAlceFilePrintInto >> fileDescriptorReference [

	^ fileDescriptorReference
]

{ #category : #accessing }
MOAlceFilePrintInto >> fileDescriptorReference: anObject [

	fileDescriptorReference := anObject
]

{ #category : #accessing }
MOAlceFilePrintInto >> printingReferences [

	^ printingReferences
]

{ #category : #accessing }
MOAlceFilePrintInto >> printingReferences: anObject [

	printingReferences := anObject
]
