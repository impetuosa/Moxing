Class {
	#name : #MOAlceOnErrorResumeNext,
	#superclass : #MOAlceResumeNext,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceOnErrorResumeNext >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [ 
	^ aMOModelWriteTypeBasedCopyResolver visitOnErrorResumeNext: self 
]
