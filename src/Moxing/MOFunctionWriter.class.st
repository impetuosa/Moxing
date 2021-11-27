Class {
	#name : #MOFunctionWriter,
	#superclass : #MOSubProcedureWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOFunctionWriter >> initializeWriteBuilder [

	writeBuilder := builder functionBuilder
]

{ #category : #writing }
MOFunctionWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #function / anEntity selector
]

{ #category : #writing }
MOFunctionWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addFunction: anEntity
]

{ #category : #writing }
MOFunctionWriter >> returnType: aReference [

	writeBuilder returnType: aReference
]

{ #category : #writing }
MOFunctionWriter >> returnTypeReference: aReference [
	writeBuilder returnTypeReference: aReference
]
