"
i do write type paraemeters 
"
Class {
	#name : #MOTypeParameterWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#category : #'Moxing-MicroWriters'
}

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
