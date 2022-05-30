Class {
	#name : #MOParametrizableClassWriter,
	#superclass : #MOClassWriter,
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
