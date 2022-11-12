Class {
	#name : #MOAlceOnErrorResumeNext,
	#superclass : #MOAlceResumeNext,
	#category : #'Moxing-Access-Statements'
}

{ #category : #visiting }
MOAlceOnErrorResumeNext >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [ 
	^ aMOModelWriteTypeBasedCopyResolver visitOnErrorResumeNext: self 
]
