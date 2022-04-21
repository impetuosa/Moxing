"
I do write attributes. I allow the annotation and modifiers of such attirbutes 
"
Class {
	#name : #MOAttributeWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOAttributeWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitAttributeWriter: self 


]

{ #category : #adding }
MOAttributeWriter >> addModifier: aString [

	writeBuilder addModifier: aString
]

{ #category : #writing }
MOAttributeWriter >> initializeWriteBuilder [

	writeBuilder := builder attributeBuilder
]

{ #category : #writing }
MOAttributeWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #attribute / anEntity name
]

{ #category : #writing }
MOAttributeWriter >> privateWriteToSurface: anEntity [
	surface addAttribute: anEntity
]

{ #category : #writing }
MOAttributeWriter >> writeAnnotation: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAnnotationWriter
]
