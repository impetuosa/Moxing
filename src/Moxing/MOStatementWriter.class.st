Class {
	#name : #MOStatementWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOStatementWriter >> initializeWriteBuilder [

	" statement writer select builder according with the mehtod usedt "

	
]

{ #category : #writing }
MOStatementWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #statement / anEntity className 
]

{ #category : #writing }
MOStatementWriter >> privateWriteToSurface: anEntity [

	surface addStatement: anEntity.
	anEntity parent: surface.
	
]

{ #category : #'accessing - token' }
MOStatementWriter >> return [

	^ writeBuilder := builder returnBuilder
]
