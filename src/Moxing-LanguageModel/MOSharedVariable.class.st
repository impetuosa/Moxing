Class {
	#name : #MOSharedVariable,
	#superclass : #MOGlobalVariable,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOSharedVariable >> acceptVisitor: aVisitor [
	 ^ aVisitor visitSharedVariable: self 
]

{ #category : #visiting }
MOSharedVariable >> isSharedVariable [
^ true 
]
