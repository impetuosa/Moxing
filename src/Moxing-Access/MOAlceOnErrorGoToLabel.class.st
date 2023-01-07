Class {
	#name : #MOAlceOnErrorGoToLabel,
	#superclass : #MOGoToLabel,
	#category : #'Moxing-Access-Statements'
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
