Class {
	#name : #MOVariableWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOVariableWriter >> initializeWriteBuilder [

	writeBuilder := builder variableBuilder
]

{ #category : #generated }
MOVariableWriter >> modifier: aString [ 
	writeBuilder addModifier: aString 
]

{ #category : #writing }
MOVariableWriter >> name: aName [

	writeBuilder name: aName
]

{ #category : #writing }
MOVariableWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #variable / anEntity name
]

{ #category : #writing }
MOVariableWriter >> privateWriteToSurface: anEntity [

	surface addVariable: anEntity.
	anEntity parent: surface.
	
]

{ #category : #writing }
MOVariableWriter >> typeReference: aTypeReference [
	writeBuilder typeReference: aTypeReference.
]
