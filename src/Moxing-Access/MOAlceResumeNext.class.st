Class {
	#name : #MOAlceResumeNext,
	#superclass : #MOAlceResume,
	#category : #'Moxing-Access-Statements'
}

{ #category : #visiting }
MOAlceResumeNext >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [ 
	^ aMOModelWriteTypeBasedCopyResolver visitResumeNext: self 
]
