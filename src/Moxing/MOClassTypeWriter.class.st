Class {
	#name : #MOClassTypeWriter,
	#superclass : #MOTypeParameterWriter,
	#instVars : [
		'parent'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOClassTypeWriter >> addModifier: aString [
	writeBuilder addModifier: aString
]

{ #category : #accessing }
MOClassTypeWriter >> fullName: aString [

	writeBuilder fullName: aString
]

{ #category : #generated }
MOClassTypeWriter >> imports: aCollection [ 
	writeBuilder imports: aCollection 
]

{ #category : #writing }
MOClassTypeWriter >> initializeWriteBuilder [
	writeBuilder := builder classTypeBuilder
]

{ #category : #accessing }
MOClassTypeWriter >> package: aMOPackage [ 
	writeBuilder package: aMOPackage 
]

{ #category : #'as yet unclassified' }
MOClassTypeWriter >> packageReference: aMOPackageReference [ 
	writeBuilder packageReference: aMOPackageReference 
]

{ #category : #writing }
MOClassTypeWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #type / anEntity name
]

{ #category : #writing }
MOClassTypeWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addClassType: anEntity
]

{ #category : #writing }
MOClassTypeWriter >> writeAttribute: aBlock [
	^ self preWrite: aBlock inSubWriter: MOAttributeWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeConstructor: aFullBlockClosure [ 
		^ self preWrite: aFullBlockClosure inSubWriter: MOConstructorWriter 
]

{ #category : #writing }
MOClassTypeWriter >> writeDecorator: aFullBlockClosure [ 
		^ self preWrite: aFullBlockClosure inSubWriter: MODecoratorWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeImport: aFullBlockClosure [

	^ self preWrite: aFullBlockClosure inSubWriter: MOImportWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeMethod: aBlock [
	^ self preWrite: aBlock inSubWriter: MOMethodWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeTypeParameter: aFullBlockClosure [ 

	^ self preWrite: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
