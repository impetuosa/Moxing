Class {
	#name : #MOParametrizableMethodWriter,
	#superclass : #MOMethodWriter,
	#category : #'Moxing-MicroWriters'
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

	^ self write: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
