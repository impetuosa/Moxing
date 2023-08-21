Class {
	#name : #MOAttributeAccessorWriter,
	#superclass : #MOMethodWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOAttributeAccessorWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitAccessorWriter: self 


]

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
