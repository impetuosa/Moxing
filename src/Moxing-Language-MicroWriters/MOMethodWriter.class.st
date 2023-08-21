"
I build methods and allow to add the same as my parent
"
Class {
	#name : #MOMethodWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
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

{ #category : #accessing }
MOMethodWriter >> annotationInstances [
	^ writeBuilder annotationInstances 
]

{ #category : #writing }
MOMethodWriter >> initializeWriteBuilder [

	writeBuilder := builder methodBuilder
]

{ #category : #accessing }
MOMethodWriter >> kind: aString [ 
	
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

	<doc: 'Writes an annotation within a the context of a method.'>
	^ self write: aFullBlockClosure inSubWriter: MOAnnotationWriter
]

{ #category : #writing }
MOMethodWriter >> writeTypeParameter: aFullBlockClosure [
	<doc: 'Writes a type parameter within a the context of a method.'>
	^ self write: aFullBlockClosure inSubWriter: MOTypeParameterWriter
]
