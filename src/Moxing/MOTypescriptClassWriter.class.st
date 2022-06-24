Class {
	#name : #MOTypescriptClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOTypescriptClassWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitClassWriter: self 


]

{ #category : #initialization }
MOTypescriptClassWriter >> initializeWriteBuilder [

	writeBuilder := builder typescriptClassBuilder
]

{ #category : #writing }
MOTypescriptClassWriter >> writeDecorator: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MODecoratorWriter 
]
