"
I build class types allowing to write in my context attributes, constructors, methods, etc 
"
Class {
	#name : #MOClassTypeWriter,
	#superclass : #MOTypeParameterWriter,
	#instVars : [
		'parent'
	],
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOClassTypeWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitTypeWriter: self 


]

{ #category : #adding }
MOClassTypeWriter >> addAnnotationInstance: aMOAnnotationInstance [

	writeBuilder addAnnotationInstance: aMOAnnotationInstance
]

{ #category : #adding }
MOClassTypeWriter >> addAttribute: aMOAttribute [

	writeBuilder addAttribute: aMOAttribute
]

{ #category : #adding }
MOClassTypeWriter >> addDecorator: aMODecorator [

	writeBuilder addDecorator: aMODecorator
]

{ #category : #adding }
MOClassTypeWriter >> addJavaEnum: aMOJavaEnum [

	^ writeBuilder addJavaEnum: aMOJavaEnum
]

{ #category : #adding }
MOClassTypeWriter >> addMethod: aMOProcedure [

	writeBuilder addMethod: aMOProcedure
]

{ #category : #adding }
MOClassTypeWriter >> addModifier: aString [
	writeBuilder addModifier: aString
]

{ #category : #accessing }
MOClassTypeWriter >> attributes [

	^ writeBuilder attributes
]

{ #category : #accessing }
MOClassTypeWriter >> fullName: aString [

	writeBuilder fullName: aString
]

{ #category : #writing }
MOClassTypeWriter >> initializeWriteBuilder [
	writeBuilder := builder classTypeBuilder
]

{ #category : #generated }
MOClassTypeWriter >> modifiers: aCollection [ 
	writeBuilder modifiers: aCollection 
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
MOClassTypeWriter >> privateWriteToSurface: anEntity [
	surface addClassType: anEntity
]

{ #category : #writing }
MOClassTypeWriter >> writeAnnotation: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAnnotationWriter
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
MOClassTypeWriter >> writeJavaEnum: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOJavaEnumWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeMethod: aBlock [
	^ self write: aBlock inSubWriter: MOMethodWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeParametrizableMethod: aBlock [
	^ self write: aBlock inSubWriter: MOParametrizableMethodWriter
]

{ #category : #writing }
MOClassTypeWriter >> writeTypeParameter: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
