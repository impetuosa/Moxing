Class {
	#name : #MOParametrizableClassTypeWriter,
	#superclass : #MOClassTypeWriter,
	#category : #'Moxing-MicroWriters'
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
