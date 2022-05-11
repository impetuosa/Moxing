Class {
	#name : #MOGlobalConstantWriter,
	#superclass : #MOLocalConstantWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOGlobalConstantWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitConstantWriter: self 


]

{ #category : #initialization }
MOGlobalConstantWriter >> initializeWriteBuilder [

	writeBuilder := builder globalConstantBuilder
]

{ #category : #initialization }
MOGlobalConstantWriter >> privateWriteToSurface: anEntity [
	surface addGlobalConstant: anEntity
]
