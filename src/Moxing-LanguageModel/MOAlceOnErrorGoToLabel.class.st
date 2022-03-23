Class {
	#name : #MOAlceOnErrorGoToLabel,
	#superclass : #MOAlceGoToLabel,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOAlceOnErrorGoToLabel >> acceptVisitor: aMOTransformationApplier [

	^ aMOTransformationApplier visitOnErrorGoToLabel: self
]

{ #category : #accessing }
MOAlceOnErrorGoToLabel >> printOn: aStream [ 
	aStream nextPutAll: 'On Error GoTo '.
	destination printOn: aStream 
]
