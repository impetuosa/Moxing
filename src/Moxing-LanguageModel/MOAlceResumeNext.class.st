Class {
	#name : #MOAlceResumeNext,
	#superclass : #MOAlceResume,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceResumeNext >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [ 
	^ aMOModelWriteTypeBasedCopyResolver visitResumeNext: self 
]
