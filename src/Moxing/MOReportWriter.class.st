Class {
	#name : #MOReportWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOReportWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitReportWriter: self 


]

{ #category : #initialization }
MOReportWriter >> initializeWriteBuilder [
	writeBuilder := builder reportBuilder
]
