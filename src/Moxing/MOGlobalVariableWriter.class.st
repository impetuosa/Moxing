Class {
	#name : #MOGlobalVariableWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOGlobalVariableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitVariableWriter: self 


]

{ #category : #initialization }
MOGlobalVariableWriter >> initializeWriteBuilder [

	writeBuilder := builder globalVariableBuilder
]

{ #category : #initialization }
MOGlobalVariableWriter >> privateWriteToSurface: anEntity [
	surface addGlobalVariable: anEntity
]
