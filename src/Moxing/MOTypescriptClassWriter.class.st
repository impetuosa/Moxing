Class {
	#name : #MOTypescriptClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOTypescriptClassWriter >> initializeWriteBuilder [

	writeBuilder := builder typescriptClassBuilder
]

{ #category : #writing }
MOTypescriptClassWriter >> writeDecorator: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MODecoratorWriter 
]
