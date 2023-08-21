Class {
	#name : #MOVariableAccessorWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOVariableAccessorWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitAccessorWriter: self 


]

{ #category : #initialization }
MOVariableAccessorWriter >> initializeWriteBuilder [

	writeBuilder := builder variableAccessorBuilder
]

{ #category : #accessing }
MOVariableAccessorWriter >> kind: aString [ 
	writeBuilder kind: aString 
]
