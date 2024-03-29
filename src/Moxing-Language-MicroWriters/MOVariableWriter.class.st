"
I do write variables .
"
Class {
	#name : #MOVariableWriter,
	#superclass : #MOModelProceduralWriter,
	#instVars : [
		'onTop'
	],
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOVariableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitVariableWriter: self 


]

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
	onTop := false.
	writeBuilder := builder localVariableBuilder
]

{ #category : #generated }
MOVariableWriter >> initializer [
	^ writeBuilder initializer 
]

{ #category : #generated }
MOVariableWriter >> initializer: anInit [  
	writeBuilder initializer: anInit 
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
MOVariableWriter >> privateWriteToSurface: anEntity [

	onTop
		ifTrue: [ surface addLocalVariableOnTop: anEntity ]
		ifFalse: [ surface addLocalVariable: anEntity ]
]

{ #category : #initialization }
MOVariableWriter >> setStaticBinding [

	writeBuilder setStaticBinding
]

{ #category : #writing }
MOVariableWriter >> typeReference: aTypeReference [
	writeBuilder typeReference: aTypeReference.
]

{ #category : #accessing }
MOVariableWriter >> visibility: anUndefinedObject [ 
	writeBuilder visibility: anUndefinedObject 
]

{ #category : #writing }
MOVariableWriter >> writeExpression: aBlock [

	^ self writeUnregisteredExpression: aBlock
]

{ #category : #generated }
MOVariableWriter >> writeInitializer: aBlock [ 
	writeBuilder initializer: (self writeExpression: aBlock) 
]

{ #category : #writing }
MOVariableWriter >> writeOnTop [
	 onTop := true.
]
