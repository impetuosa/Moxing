"
I do write paramteers . I allow the annotation of such a parameter
"
Class {
	#name : #MOParameterWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOParameterWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitParameterWriter: self 


]

{ #category : #adding }
MOParameterWriter >> addModifier: aString [

	writeBuilder addModifier: aString
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
