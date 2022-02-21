"
I do write variables .
"
Class {
	#name : #MOVariableWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOVariableWriter >> addAnnotationInstance: aMOAnnotationInstance [

	writeBuilder addAnnotationInstance: aMOAnnotationInstance
]

{ #category : #accessing }
MOVariableWriter >> bindingKind: aString [

	writeBuilder bindingKind: aString
]

{ #category : #writing }
MOVariableWriter >> initializeWriteBuilder [

	writeBuilder := builder variableBuilder
]

{ #category : #generated }
MOVariableWriter >> initializer: aBlock [ 
	writeBuilder initializer: (self writeExpression: aBlock) 
]

{ #category : #generated }
MOVariableWriter >> modifier: aString [ 
	writeBuilder addModifier: aString 
]

{ #category : #generated }
MOVariableWriter >> modifiers: aCollection [

	writeBuilder modifiers: aCollection
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
	surface addVariable: anEntity
]

{ #category : #writing }
MOVariableWriter >> typeReference: aTypeReference [
	writeBuilder typeReference: aTypeReference.
]

{ #category : #writing }
MOVariableWriter >> writeExpression: aBlock [

	| stmnt |
	stmnt := self immediatelyWrite: aBlock withWriter: MOExpressionWriter.
	^ stmnt
]
