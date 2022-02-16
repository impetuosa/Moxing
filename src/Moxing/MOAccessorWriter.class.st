Class {
	#name : #MOAccessorWriter,
	#superclass : #MOMethodWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOAccessorWriter >> initializeWriteBuilder [

	writeBuilder := builder accessorBuilder
]

{ #category : #initialization }
MOAccessorWriter >> kind: aKind [

	writeBuilder kind: aKind
]

{ #category : #initialization }
MOAccessorWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addAccessor: anEntity
]
