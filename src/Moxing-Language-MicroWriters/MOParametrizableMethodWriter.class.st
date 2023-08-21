Class {
	#name : #MOParametrizableMethodWriter,
	#superclass : #MOMethodWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOParametrizableMethodWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitMethodWriter: self 


]

{ #category : #adding }
MOParametrizableMethodWriter >> addTypeParameter: aMOTypeParameter [ 
	writeBuilder addTypeParameter: aMOTypeParameter 
]

{ #category : #initialization }
MOParametrizableMethodWriter >> initializeWriteBuilder [

	writeBuilder := builder parametrizableMethodBuilder
]

{ #category : #writing }
MOParametrizableMethodWriter >> writeTypeParameter: aFullBlockClosure [ 
	<doc: 'Writes type parameter within a the context of a method.'>
	^ self write: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
