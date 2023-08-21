"
I build functions and allow to add the same as my parent. I do allow to define a return type rerference .
"
Class {
	#name : #MOFunctionWriter,
	#superclass : #MOSubProcedureWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOFunctionWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitFunctionWriter: self 


]

{ #category : #accessing }
MOFunctionWriter >> fileReference: anUndefinedObject [ 
	writeBuilder fileReference: anUndefinedObject 
]

{ #category : #writing }
MOFunctionWriter >> initializeWriteBuilder [

	writeBuilder := builder functionBuilder
]

{ #category : #writing }
MOFunctionWriter >> privateWriteToSurface: anEntity [
	surface addFunction: anEntity
]

{ #category : #writing }
MOFunctionWriter >> returnType: aReference [

	writeBuilder returnType: aReference
]

{ #category : #accessing }
MOFunctionWriter >> returnTypeReference [
	^ writeBuilder returnTypeReference
]

{ #category : #writing }
MOFunctionWriter >> returnTypeReference: aReference [
	writeBuilder returnTypeReference: aReference
]
