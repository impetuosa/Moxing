Class {
	#name : #MOSharedConstant,
	#superclass : #MOGlobalConstant,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOSharedConstant >> acceptVisitor: aVisitor [
	 ^ aVisitor visitSharedConstant: self 
]
