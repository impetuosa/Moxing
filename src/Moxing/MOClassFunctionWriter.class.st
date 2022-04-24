Class {
	#name : #MOClassFunctionWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOClassFunctionWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitFunctionWriter: self 


]

{ #category : #initialization }
MOClassFunctionWriter >> initializeWriteBuilder [

	writeBuilder := builder classFunctionBuilder
]
