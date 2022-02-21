"
I build class types allowing to write in my context attributes, constructors, methods, etc 
"
Class {
	#name : #MOClassTypeWriter,
	#superclass : #MOTypeParameterWriter,
	#instVars : [
		'parent'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOClassTypeWriter >> addAttribute: aMOAttribute [

	writeBuilder addAttribute: aMOAttribute
]

{ #category : #adding }
MOClassTypeWriter >> addDecorator: aMODecorator [

	writeBuilder addDecorator: aMODecorator
]

{ #category : #adding }
MOClassTypeWriter >> addMethod: aMOProcedure [

	writeBuilder addMethod: aMOProcedure
]

{ #category : #adding }
MOClassTypeWriter >> addModifier: aString [
	writeBuilder addModifier: aString
]

{ #category : #adding }
MOClassTypeWriter >> addTypeParameter: aMOTypeParameter [

	writeBuilder addTypeParameter: aMOTypeParameter
]

{ #category : #accessing }
MOClassTypeWriter >> fullName: aString [

	writeBuilder fullName: aString
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
	surface addClassType: anEntity
]

{ #category : #writing }
MOClassTypeWriter >> writeAttribute: aBlock [
	^ self write: aBlock inSubWriter: MOAttributeWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeConstructor: aFullBlockClosure [ 
		^ self write: aFullBlockClosure inSubWriter: MOConstructorWriter 
]

{ #category : #writing }
MOClassTypeWriter >> writeDecorator: aFullBlockClosure [ 
		^ self write: aFullBlockClosure inSubWriter: MODecoratorWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeMethod: aBlock [
	^ self write: aBlock inSubWriter: MOMethodWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeTypeParameter: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
