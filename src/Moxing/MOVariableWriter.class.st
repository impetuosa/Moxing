Class {
	#name : #MOVariableWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOVariableWriter >> initializeWriteBuilder [

	writeBuilder := builder variableBuilder
]

{ #category : #generated }
MOVariableWriter >> initializer: anUndefinedObject [ 
	writeBuilder initializer: anUndefinedObject 
]

{ #category : #generated }
MOVariableWriter >> modifier: aString [ 
	writeBuilder addModifier: aString 
]

{ #category : #generated }
MOVariableWriter >> modifiers: aCollection [

	writeBuilder modifiers: aCollection
]

{ #category : #writing }
MOVariableWriter >> name: aName [

	writeBuilder name: aName
]

{ #category : #writing }
MOVariableWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #variable / anEntity name
]

{ #category : #writing }
MOVariableWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addVariable: anEntity
]

{ #category : #writing }
MOVariableWriter >> typeReference: aTypeReference [
	writeBuilder typeReference: aTypeReference.
]

{ #category : #writing }
MOVariableWriter >> writeNewExpression: aFullBlockClosure [

	^ self
		  preWrite: aFullBlockClosure
		  inSubWriter: MOStatementNewExpressionWriter
]
