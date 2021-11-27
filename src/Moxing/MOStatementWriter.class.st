Class {
	#name : #MOStatementWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOStatementWriter >> initializeWriteBuilder [

	self subclassResponsibility 
]

{ #category : #writing }
MOStatementWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #statement / anEntity className 
]

{ #category : #writing }
MOStatementWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addStatement: anEntity
]
