"
I build methods and allow to add the same as my parent
"
Class {
	#name : #MOMethodWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOMethodWriter >> addAnnotationInstance: aMOAnnotationInstance [

	writeBuilder addAnnotationInstance: aMOAnnotationInstance
]

{ #category : #adding }
MOMethodWriter >> addThrownTypeReference: aMOTypeReference [

	writeBuilder addThrownTypeReference: aMOTypeReference
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
