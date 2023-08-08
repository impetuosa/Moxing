Class {
	#name : #MOClassSubProcedureWriter,
	#superclass : #MOSubProcedureWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOClassSubProcedureWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitProcedureWriter: self 


]

{ #category : #initialization }
MOClassSubProcedureWriter >> initializeWriteBuilder [

	writeBuilder := builder classProcedureBuilder
]
