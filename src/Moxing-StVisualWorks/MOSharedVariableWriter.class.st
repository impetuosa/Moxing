Class {
	#name : #MOSharedVariableWriter,
	#superclass : #MOGlobalVariableWriter,
	#category : #'Moxing-StVisualWorks-writer'
}

{ #category : #visiting }
MOSharedVariableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitVariableWriter: self 


]

{ #category : #initialization }
MOSharedVariableWriter >> initializeWriteBuilder [ 
	writeBuilder := builder sharedVariableBuilder
]

{ #category : #testing }
MOSharedVariableWriter >> isPreexisting: aBoolean [ 
	writeBuilder isPreexisting: aBoolean 
]

{ #category : #testing }
MOSharedVariableWriter >> privateWriteToSurface: anEntity [

	surface addSharedVariable: anEntity
]
