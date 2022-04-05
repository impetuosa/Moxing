Class {
	#name : #MOBlockClosureWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-Smalltalk-writer'
}

{ #category : #accessing }
MOBlockClosureWriter >> block: aMOBlock [

	writeBuilder block: aMOBlock
]

{ #category : #initialization }
MOBlockClosureWriter >> initializeWriteBuilder [

	writeBuilder := builder blockClosureBuilder
]

{ #category : #writing }
MOBlockClosureWriter >> privateWriteToSurface: aBlockClosure [

	^ aBlockClosure
	"	^ surface expression: aBlockClosure"
]

{ #category : #writing }
MOBlockClosureWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]
