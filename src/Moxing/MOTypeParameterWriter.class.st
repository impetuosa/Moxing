Class {
	#name : #MOTypeParameterWriter,
	#superclass : #MOModelProceduralWriter,
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

{ #category : #writing }
MOTypeParameterWriter >> name: aName [

	(aName indexOf: $.) > 0 ifTrue: [ self halt ].
	writeBuilder name: aName
]

{ #category : #initialization }
MOTypeParameterWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #type / anEntity name
]

{ #category : #initialization }
MOTypeParameterWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addTypeParameter: anEntity
]

{ #category : #accessing }
MOTypeParameterWriter >> superTypeReferences: aCollection [ 
	writeBuilder superTypeReferences: aCollection 
]
