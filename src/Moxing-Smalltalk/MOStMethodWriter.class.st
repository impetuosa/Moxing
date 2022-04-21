Class {
	#name : #MOStMethodWriter,
	#superclass : #MOMethodWriter,
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #visiting }
MOStMethodWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitMethodWriter: self 


]

{ #category : #accessing }
MOStMethodWriter >> category: aString [ 
	 writeBuilder category: aString 
]

{ #category : #initialization }
MOStMethodWriter >> initializeWriteBuilder [ 
	writeBuilder := builder stMethodBuilder
]
