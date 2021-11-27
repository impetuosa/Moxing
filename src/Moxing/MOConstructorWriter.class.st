Class {
	#name : #MOConstructorWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOConstructorWriter >> addModifier: aString [ 
	writeBuilder addModifier: aString 
]

{ #category : #adding }
MOConstructorWriter >> addThrownTypeReference: aMOTypeReference [

	writeBuilder addThrownTypeReference: aMOTypeReference
]

{ #category : #writing }
MOConstructorWriter >> initializeWriteBuilder [

	writeBuilder := builder constructorBuilder
]

{ #category : #generated }
MOConstructorWriter >> modifiers: aCollection [ 
	writeBuilder modifiers: aCollection 
]

{ #category : #writing }
MOConstructorWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #constructor / anEntity parameters size asString 
]

{ #category : #writing }
MOConstructorWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addConstructor: anEntity
]

{ #category : #accessing }
MOConstructorWriter >> visibility: aString [ 
	writeBuilder visibility: aString 
]

{ #category : #writing }
MOConstructorWriter >> writeAnnotation: aFullBlockClosure [

	^ self preWrite: aFullBlockClosure inSubWriter: MOAnnotationWriter
]

{ #category : #writing }
MOConstructorWriter >> writeBlock: aBlock [

	^ self
		  preWrite: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOConstructorWriter >> writeParameter: aBlock [

	^ self preWrite: aBlock inSubWriter: MOParameterWriter
]

{ #category : #writing }
MOConstructorWriter >> writeTypeParameter: aFullBlockClosure [ 

	^ self preWrite: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
