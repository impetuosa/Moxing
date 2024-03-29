Class {
	#name : #MOLocalConstantWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOLocalConstantWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitConstantWriter: self 


]

{ #category : #generated }
MOLocalConstantWriter >> initializeWriteBuilder [

	writeBuilder := builder localConstantBuilder
]

{ #category : #generated }
MOLocalConstantWriter >> privateWriteToSurface: anEntity [
	surface addLocalConstant: anEntity
]

{ #category : #generated }
MOLocalConstantWriter >> value: aValue [ 
	writeBuilder value: aValue 
]
