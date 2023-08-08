"
I do write paramteers . I allow the annotation of such a parameter
"
Class {
	#name : #MOParameterWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOParameterWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitParameterWriter: self 


]

{ #category : #adding }
MOParameterWriter >> addModifier: aString [

	writeBuilder addModifier: aString
]

{ #category : #accessing }
MOParameterWriter >> annotationInstances [
	^ writeBuilder annotationInstances 
]

{ #category : #writing }
MOParameterWriter >> initializeWriteBuilder [
	writeBuilder := builder parameterBuilder 
]

{ #category : #testing }
MOParameterWriter >> isOptional: aBoolean [ 
	writeBuilder isOptional: aBoolean 
]

{ #category : #'as yet unclassified' }
MOParameterWriter >> mapsToVariableArguments [
	writeBuilder mapsToVariableArguments: true. 
]

{ #category : #writing }
MOParameterWriter >> privateWriteToSurface: anEntity [
	surface addParameter: anEntity
]

{ #category : #writing }
MOParameterWriter >> writeAnnotation: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAnnotationWriter
]
