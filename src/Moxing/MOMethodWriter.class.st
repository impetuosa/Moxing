"
I build methods and allow to add the same as my parent
"
Class {
	#name : #MOMethodWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOMethodWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitMethodWriter: self 


]

{ #category : #writing }
MOMethodWriter >> addAnnotationInstance: aMOAnnotationInstance [

	writeBuilder addAnnotationInstance: aMOAnnotationInstance
]

{ #category : #adding }
MOMethodWriter >> addThrownTypeReference: aMOTypeReference [

	writeBuilder addThrownTypeReference: aMOTypeReference
]

{ #category : #adding }
MOMethodWriter >> addTypeParameter: aMOTypeParameter [

	writeBuilder addTypeParameter: aMOTypeParameter
]

{ #category : #writing }
MOMethodWriter >> initializeWriteBuilder [

	writeBuilder := builder methodBuilder
]

{ #category : #writing }
MOMethodWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #method / anEntity selector
]

{ #category : #writing }
MOMethodWriter >> privateWriteToSurface: anEntity [
	surface addMethod: anEntity
]

{ #category : #writing }
MOMethodWriter >> selector: aSelector [
	super selector: aSelector
]

{ #category : #writing }
MOMethodWriter >> writeAnnotation: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAnnotationWriter
]

{ #category : #writing }
MOMethodWriter >> writeTypeParameter: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
