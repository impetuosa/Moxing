Class {
	#name : #MOConstructorWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOConstructorWriter >> initializeWriteBuilder [

	writeBuilder := builder constructorBuilder
]

{ #category : #writing }
MOConstructorWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #constructor / anEntity parameters size asString 
]

{ #category : #writing }
MOConstructorWriter >> privateWriteToSurface: anEntity [

	surface addConstructor: anEntity.
	anEntity parent: surface.

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
