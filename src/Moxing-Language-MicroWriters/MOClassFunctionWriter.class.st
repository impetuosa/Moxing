Class {
	#name : #MOClassFunctionWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOClassFunctionWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitFunctionWriter: self 


]

{ #category : #initialization }
MOClassFunctionWriter >> initializeWriteBuilder [

	writeBuilder := builder classFunctionBuilder
]
