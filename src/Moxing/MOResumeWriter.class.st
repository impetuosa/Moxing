Class {
	#name : #MOResumeWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'caseExpression'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOResumeWriter >> initializeWriteBuilder [

	writeBuilder := builder resumeBuilder
]
