Class {
	#name : #MOJavaVariableReference,
	#superclass : #Object,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #actions }
MOJavaVariableReference >> load: aJavaNameNode [

	aJavaNameNode ifNil: [ ^ writer referenceToSelf ].
	^ aJavaNameNode acceptVisitor: self
]

{ #category : #visiting }
MOJavaVariableReference >> visitName: aJavaNameNode [

	^ writer variableReferenceNamed: aJavaNameNode name value
]

{ #category : #accessing }
MOJavaVariableReference >> writer: aMOBlockWriter [ 
	writer := aMOBlockWriter
]
