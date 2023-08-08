Class {
	#name : #MOParametrizableClassTypeWriter,
	#superclass : #MOJavaClassTypeWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOParametrizableClassTypeWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitTypeWriter: self 


]

{ #category : #adding }
MOParametrizableClassTypeWriter >> addTypeParameter: aMOTypeParameter [

	writeBuilder addTypeParameter: aMOTypeParameter
]

{ #category : #adding }
MOParametrizableClassTypeWriter >> initializeWriteBuilder [
	writeBuilder := builder parametrizableClassTypeBuilder
]

{ #category : #writing }
MOParametrizableClassTypeWriter >> writeParametrizableClass: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MOParametrizableClassWriter  
]
