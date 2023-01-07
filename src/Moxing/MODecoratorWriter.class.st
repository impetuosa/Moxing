"
I do write decorators! typescript style 
"
Class {
	#name : #MODecoratorWriter,
	#superclass : #MOAnnotationWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MODecoratorWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitDecoratorWriter: self 


]

{ #category : #'as yet unclassified' }
MODecoratorWriter >> decoratorTypeReference: aMOTypeReference [

	self annotationTypeReference: aMOTypeReference
]

{ #category : #initialization }
MODecoratorWriter >> initializeWriteBuilder [
	writeBuilder := builder decoratorBuilder
]

{ #category : #initialization }
MODecoratorWriter >> privateWriteToSurface: anEntity [
	surface addDecorator: anEntity
]
