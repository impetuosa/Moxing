Class {
	#name : #MOAttributeAccessorWriter,
	#superclass : #MOMethodWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOAttributeAccessorWriter >> addTypeParameter: aMOTypeParameter [

	writeBuilder addTypeParameter: aMOTypeParameter
]

{ #category : #initialization }
MOAttributeAccessorWriter >> initializeWriteBuilder [

	writeBuilder := builder attributeAccessorBuilder
]

{ #category : #initialization }
MOAttributeAccessorWriter >> kind: aKind [

	writeBuilder kind: aKind
]

{ #category : #initialization }
MOAttributeAccessorWriter >> privateWriteToSurface: anEntity [
	surface addAttributeAccessor: anEntity
]
