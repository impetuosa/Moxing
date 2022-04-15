Class {
	#name : #MOSharedVariable,
	#superclass : #MOGlobalVariable,
	#category : #'Moxing-StVisualWorks-model'
}

{ #category : #visiting }
MOSharedVariable >> acceptVisitor: aVisitor [
	 ^ aVisitor visitSharedVariable: self 
]
