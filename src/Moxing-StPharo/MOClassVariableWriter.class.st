Class {
	#name : #MOClassVariableWriter,
	#superclass : #MOGlobalVariableWriter,
	#category : #'Moxing-StPharo-Model'
}

{ #category : #visiting }
MOClassVariableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitVariableWriter: self 


]

{ #category : #initialization }
MOClassVariableWriter >> initializeWriteBuilder [ 
	writeBuilder := builder classVariableBuilder
]

{ #category : #testing }
MOClassVariableWriter >> isPreexisting: aBoolean [ 
	writeBuilder isPreexisting: aBoolean 
]

{ #category : #testing }
MOClassVariableWriter >> privateWriteToSurface: anEntity [

	surface addSharedVariable: anEntity
]
