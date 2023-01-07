Class {
	#name : #MOJavaClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOJavaClassWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitJavaClassWriter: self 


]

{ #category : #adding }
MOJavaClassWriter >> addClass: aMOJavaClass [

	writeBuilder addClass: aMOJavaClass
]

{ #category : #adding }
MOJavaClassWriter >> addClassType: aMOClassType [

	writeBuilder addClassType: aMOClassType
]

{ #category : #adding }
MOJavaClassWriter >> addEnum: aMOEnum [

	^ writeBuilder addEnum: aMOEnum
]

{ #category : #adding }
MOJavaClassWriter >> addJavaEnum: aMOJavaEnum [

	^ writeBuilder addJavaEnum: aMOJavaEnum
]

{ #category : #initialization }
MOJavaClassWriter >> initializeWriteBuilder [
	writeBuilder := builder javaClassBuilder
]

{ #category : #expressions }
MOJavaClassWriter >> noOp: aString [

	^ builder noOpBuilder
		  description: aString;
		  build
]

{ #category : #accessing }
MOJavaClassWriter >> staticInitializer: aMOStaticInitializer [

	^ writeBuilder staticInitializer: aMOStaticInitializer
]

{ #category : #writing }
MOJavaClassWriter >> writeClassType: aBlock [

	^ self write: aBlock inSubWriter: MOClassTypeWriter
]

{ #category : #writing }
MOJavaClassWriter >> writeJavaClass: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MOJavaClassWriter >> writeJavaClassType: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassTypeWriter
]

{ #category : #writing }
MOJavaClassWriter >> writeJavaEnum: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOJavaEnumWriter
]

{ #category : #writing }
MOJavaClassWriter >> writeStaticInitializer: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOStaticInitializerWriter
]
