Class {
	#name : #MOReportWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOReportWriter >> initializeWriteBuilder [
	writeBuilder := builder reportBuilder
]
