Class {
	#name : #MOSharedConstant,
	#superclass : #MOGlobalConstant,
	#category : #'Moxing-StVisualWorks-model'
}

{ #category : #visiting }
MOSharedConstant >> acceptVisitor: aVisitor [
	 ^ aVisitor visitSharedConstant: self 
]
