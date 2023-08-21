"
I build constructors and allow to include annotations, blocks, parameters and type parameters
"
Class {
	#name : #MOConstructorWriter,
	#superclass : #MOInvocableWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOConstructorWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitConstructorWriter: self 


]

{ #category : #adding }
MOConstructorWriter >> addAnnotationInstance: aMOAnnotationInstance [

	writeBuilder addAnnotationInstance: aMOAnnotationInstance
]

{ #category : #adding }
MOConstructorWriter >> addModifier: aString [ 
	writeBuilder addModifier: aString 
]

{ #category : #adding }
MOConstructorWriter >> addParameter: aMOParameter [

	writeBuilder addParameter: aMOParameter
]

{ #category : #adding }
MOConstructorWriter >> addThrownTypeReference: aMOTypeReference [

	writeBuilder addThrownTypeReference: aMOTypeReference
]

{ #category : #adding }
MOConstructorWriter >> addTypeParameter: aMOTypeParameter [

	writeBuilder addTypeParameter: aMOTypeParameter
]

{ #category : #generated }
MOConstructorWriter >> block: aMOBlock [

	writeBuilder block: aMOBlock
]

{ #category : #writing }
MOConstructorWriter >> initializeWriteBuilder [

	writeBuilder := builder constructorBuilder
]

{ #category : #generated }
MOConstructorWriter >> modifiers: aCollection [ 
	writeBuilder modifiers: aCollection 
]

{ #category : #generated }
MOConstructorWriter >> parameters [
	^ writeBuilder parameters
]

{ #category : #writing }
MOConstructorWriter >> privateWriteToSurface: anEntity [

	surface addConstructor: anEntity
]

{ #category : #accessing }
MOConstructorWriter >> visibility: aString [ 
	writeBuilder visibility: aString 
]

{ #category : #writing }
MOConstructorWriter >> writeAnnotation: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAnnotationWriter
]

{ #category : #writing }
MOConstructorWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOConstructorWriter >> writeParameter: aBlock [

	^ self write: aBlock inSubWriter: MOParameterWriter
]

{ #category : #writing }
MOConstructorWriter >> writeTypeParameter: aFullBlockClosure [

	<doc:
	'Writes a parameter type within a the context of a constructor.'>
	^ self write: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
