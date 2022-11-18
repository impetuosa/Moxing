Class {
	#name : #MOSharedConstantWriter,
	#superclass : #MOGlobalConstantWriter,
	#category : #'Moxing-LanguageModel-Writting'
}

{ #category : #visiting }
MOSharedConstantWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitConstantWriter: self 


]

{ #category : #initialization }
MOSharedConstantWriter >> initializeWriteBuilder [ 
	writeBuilder := builder globalConstantBuilder
]

{ #category : #initialization }
MOSharedConstantWriter >> isPreexisting: aBoolean [ 
	writeBuilder isPreexisting: aBoolean 
]

{ #category : #initialization }
MOSharedConstantWriter >> privateWriteToSurface: anEntity [

	surface addSharedConstant: anEntity
]
