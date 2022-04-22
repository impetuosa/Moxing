Class {
	#name : #MOClassSubProcedureWriter,
	#superclass : #MOSubProcedureWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOClassSubProcedureWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitProcedureWriter: self 


]

{ #category : #initialization }
MOClassSubProcedureWriter >> initializeWriteBuilder [

	writeBuilder := builder classProcedureBuilder
]
