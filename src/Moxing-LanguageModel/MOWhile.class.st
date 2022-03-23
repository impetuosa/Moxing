Class {
	#name : #MOWhile,
	#superclass : #MOLoop,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOWhile >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitWhile: self
]
