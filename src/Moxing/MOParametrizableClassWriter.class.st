Class {
	#name : #MOParametrizableClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOParametrizableClassWriter >> addTypeParameter: aMOTypeParameter [

	writeBuilder addTypeParameter: aMOTypeParameter
]

{ #category : #adding }
MOParametrizableClassWriter >> initializeWriteBuilder [

	writeBuilder := builder parametrizableClassBuilder
]
