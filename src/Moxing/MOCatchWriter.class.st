Class {
	#name : #MOCatchWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'parameters'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOCatchWriter >> addParameter: aMOParameter [

	writeBuilder addParameter: aMOParameter
]

{ #category : #generated }
MOCatchWriter >> block: aMOBlock [

	writeBuilder block: aMOBlock
]

{ #category : #initialization }
MOCatchWriter >> initializeWriteBuilder [

	writeBuilder := builder catchBuilder
]

{ #category : #writing }
MOCatchWriter >> privateWriteToSurface: anEntity [
	surface addCatch: anEntity

]

{ #category : #writing }
MOCatchWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #writing }
MOCatchWriter >> writeParameter: aBlock [

	^ self write: aBlock inSubWriter: MOParameterWriter
]
