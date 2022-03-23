Class {
	#name : #MOTypeReferenceVisitor,
	#superclass : #Object,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-Reader'
}

{ #category : #'as yet unclassified' }
MOTypeReferenceVisitor >> typeReferenceFor: aJavaClassTypeNode [

	^ aJavaClassTypeNode acceptVisitor: self
]

{ #category : #visiting }
MOTypeReferenceVisitor >> visitName: aJavaNameNode [

	^ writer typeReferenceNamed: aJavaNameNode name value
]

{ #category : #accessing }
MOTypeReferenceVisitor >> writer: aMOClassWriter [ 
	writer := aMOClassWriter
]
