Class {
	#name : #MOAlceGoSubLabel,
	#superclass : #MOGoToLabel,
	#category : #'Moxing-Access-Statements'
}

{ #category : #visiting }
MOAlceGoSubLabel >> acceptVisitor: aVisitor [

	^ aVisitor visitGoSub: self
]
