Class {
	#name : #MOJavaDetachedStatementBuilder,
	#superclass : #Object,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #actions }
MOJavaDetachedStatementBuilder >> load: aJavaNewNode [

	^ aJavaNewNode acceptVisitor: self
]

{ #category : #visiting }
MOJavaDetachedStatementBuilder >> visitNew: aJavaNewNode [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
MOJavaDetachedStatementBuilder >> writer: aMOVariableWriter [ 
	writer := aMOVariableWriter
]
