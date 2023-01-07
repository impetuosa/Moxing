Class {
	#name : #MOJavaClassTypeWriter,
	#superclass : #MOClassTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOJavaClassTypeWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitJavaClassWriter: self 


]

{ #category : #adding }
MOJavaClassTypeWriter >> addClass: aMOJavaClass [

	writeBuilder addClass: aMOJavaClass
]

{ #category : #adding }
MOJavaClassTypeWriter >> addClassType: aMOClassType [

	writeBuilder addClassType: aMOClassType
]

{ #category : #adding }
MOJavaClassTypeWriter >> addEnum: aMOEnum [

	^ writeBuilder addEnum: aMOEnum
]

{ #category : #adding }
MOJavaClassTypeWriter >> addJavaEnum: aMOJavaEnum [

	^ writeBuilder addJavaEnum: aMOJavaEnum
]

{ #category : #initialization }
MOJavaClassTypeWriter >> initializeWriteBuilder [
	writeBuilder := builder javaClassTypeBuilder
]

{ #category : #expressions }
MOJavaClassTypeWriter >> noOp: aString [

	^ builder noOpBuilder
		  description: aString;
		  build
]

{ #category : #writing }
MOJavaClassTypeWriter >> writeClassType: aBlock [

	^ self write: aBlock inSubWriter: MOClassTypeWriter
]

{ #category : #writing }
MOJavaClassTypeWriter >> writeJavaClass: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MOJavaClassTypeWriter >> writeJavaClassType: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassTypeWriter
]

{ #category : #writing }
MOJavaClassTypeWriter >> writeJavaEnum: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOJavaEnumWriter
]
