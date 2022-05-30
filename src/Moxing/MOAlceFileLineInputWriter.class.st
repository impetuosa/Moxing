Class {
	#name : #MOAlceFileLineInputWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOAlceFileLineInputWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitFileLineInputWriter: self 


]

{ #category : #accessing }
MOAlceFileLineInputWriter >> fileDescriptorReference: aMOVariableReference [

	^ writeBuilder fileDescriptorReference: aMOVariableReference
]

{ #category : #initialization }
MOAlceFileLineInputWriter >> initializeWriteBuilder [

	writeBuilder := builder fileLineInputBuilder
]

{ #category : #accessing }
MOAlceFileLineInputWriter >> inputReference: aMOVariableReference [

	^ writeBuilder inputReference: aMOVariableReference
]
