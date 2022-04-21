"
i do write type paraemeters 
"
Class {
	#name : #MOTypeParameterWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOTypeParameterWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitParameterWriter: self 


]

{ #category : #adding }
MOTypeParameterWriter >> addSuperTypeReference: aMOTypeReference [ 
	writeBuilder addSuperTypeReference: aMOTypeReference 
]

{ #category : #initialization }
MOTypeParameterWriter >> initializeWriteBuilder [
	writeBuilder := builder typeParameterBuilder
]

{ #category : #initialization }
MOTypeParameterWriter >> privateWriteToSurface: anEntity [

	surface addTypeParameter: anEntity
]

{ #category : #accessing }
MOTypeParameterWriter >> superTypeReferences: aCollection [ 
	writeBuilder superTypeReferences: aCollection 
]

{ #category : #accessing }
MOTypeParameterWriter >> visibility: aString [ 
	^ writeBuilder visibility: aString 
]
