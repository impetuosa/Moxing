Class {
	#name : #MOParametrizableClassWriter,
	#superclass : #MOJavaClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOParametrizableClassWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitClassWriter: self 


]

{ #category : #adding }
MOParametrizableClassWriter >> addTypeParameter: aMOTypeParameter [

	writeBuilder addTypeParameter: aMOTypeParameter
]

{ #category : #adding }
MOParametrizableClassWriter >> initializeWriteBuilder [

	writeBuilder := builder parametrizableClassBuilder
]

{ #category : #writing }
MOParametrizableClassWriter >> writeParametrizableClassType: aBlock [

	^ self write: aBlock inSubWriter: MOParametrizableClassTypeWriter
]
