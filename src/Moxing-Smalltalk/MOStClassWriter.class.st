Class {
	#name : #MOStClassWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-Smalltalk-writer'
}

{ #category : #visiting }
MOStClassWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitClassWriter: self 


]

{ #category : #adding }
MOStClassWriter >> addClass: aMOMetaClass [

	self assert: (aMOMetaClass isKindOf: MOMetaClass).
	writeBuilder metaclass: aMOMetaClass
]

{ #category : #adding }
MOStClassWriter >> addSharedVariable: aMOSharedVariable [

	writeBuilder addSharedVariable: aMOSharedVariable
]

{ #category : #accessing }
MOStClassWriter >> category: aString [

	writeBuilder category: aString
]

{ #category : #initialization }
MOStClassWriter >> comment: aComment [
	writeBuilder comment: aComment 
]

{ #category : #initialization }
MOStClassWriter >> initializeWriteBuilder [

	writeBuilder := builder smalltalkClassBuilder
]

{ #category : #testing }
MOStClassWriter >> isPreexisting: anUndefinedObject [
  writeBuilder isPreexisting: anUndefinedObject
]

{ #category : #accessing }
MOStClassWriter >> sharedVariables: aCollection [

	writeBuilder sharedVariables: aCollection
]

{ #category : #writing }
MOStClassWriter >> writeClassVariable: aFullBlockClosure [ 


	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOClassVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOStClassWriter >> writeMetaclass: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOMetaClassWriter
]

{ #category : #writing }
MOStClassWriter >> writeSharedConstant: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOSharedConstantWriter.
	^ stmnt
]

{ #category : #writing }
MOStClassWriter >> writeSharedVariable: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOSharedVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOStClassWriter >> writeStMethod: aFullBlockClosure [ 
	^ self write: aFullBlockClosure inSubWriter: MOStMethodWriter
]
