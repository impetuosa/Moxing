Class {
	#name : #MOClassWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOClassWriter >> addSuperTypeReference: aMOTypeReference [ 
	writeBuilder addSuperTypeReference: aMOTypeReference 
]

{ #category : #writing }
MOClassWriter >> initializeWriteBuilder [
	writeBuilder := builder classBuilder
]

{ #category : #writing }
MOClassWriter >> name: aName [
	writeBuilder name: aName 
]

{ #category : #accessing }
MOClassWriter >> package: aMOPackage [ 
	writeBuilder package: aMOPackage 
]

{ #category : #writing }
MOClassWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #class / anEntity name
]

{ #category : #writing }
MOClassWriter >> privateWriteToSurface: anEntity [

	surface addClass: anEntity.
	anEntity parent: surface.
	
]

{ #category : #writing }
MOClassWriter >> superclassReference: superClassReference [

	writeBuilder superclassReference: superClassReference
]

{ #category : #writing }
MOClassWriter >> writeAttribute: aBlock [
	^ self preWrite: aBlock inSubWriter: MOAttributeWriter
]

{ #category : #writing }
MOClassWriter >> writeConstructor: aFullBlockClosure [ 
		^ self preWrite: aFullBlockClosure inSubWriter: MOConstructorWriter 
]

{ #category : #writing }
MOClassWriter >> writeDecorator: aFullBlockClosure [ 
		^ self preWrite: aFullBlockClosure inSubWriter: MODecoratorWriter
]

{ #category : #writing }
MOClassWriter >> writeImport: aFullBlockClosure [

	^ self preWrite: aFullBlockClosure inSubWriter: MOImportWriter
]

{ #category : #writing }
MOClassWriter >> writeMethod: aBlock [
	^ self preWrite: aBlock inSubWriter: MOMethodWriter
]
