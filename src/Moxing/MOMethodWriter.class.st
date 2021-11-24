Class {
	#name : #MOMethodWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOMethodWriter >> initializeWriteBuilder [

	writeBuilder := builder methodBuilder
]

{ #category : #writing }
MOMethodWriter >> privateWriteToSurface: anEntity [

	surface addMethod: anEntity.
	anEntity parent: surface.
]

{ #category : #writing }
MOMethodWriter >> returnType: aReference [

	writeBuilder returnType: aReference
]

{ #category : #writing }
MOMethodWriter >> returnTypeReference: aReference [
	writeBuilder returnTypeReference: aReference
]

{ #category : #writing }
MOMethodWriter >> selector: aSelector [
 	writeBuilder selector: aSelector
]

{ #category : #writing }
MOMethodWriter >> writeBlock: aBlock [

	^ self
		  preWrite: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOMethodWriter >> writeParameter: aBlock [
	^ self preWrite: aBlock inSubWriter: MOParameterWriter
]
