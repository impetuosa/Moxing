Class {
	#name : #MOAngularProtoClass,
	#superclass : #Object,
	#instVars : [
		'module',
		'class'
	],
	#category : #'Moxing-ProtoModel'
}

{ #category : #visiting }
MOAngularProtoClass >> acceptVisitor: aVisitor [
	aVisitor visitAngularProtoClass: self . 
	
]

{ #category : #'as yet unclassified' }
MOAngularProtoClass >> interfaces [
	^ class types 
]

{ #category : #'as yet unclassified' }
MOAngularProtoClass >> methods [
	^ class methods 
]

{ #category : #visiting }
MOAngularProtoClass >> module [
	^ module
]

{ #category : #visiting }
MOAngularProtoClass >> module: aModule [ 	
	module := aModule 
]

{ #category : #visiting }
MOAngularProtoClass >> name [
	^ class name 
]

{ #category : #'as yet unclassified' }
MOAngularProtoClass >> properties [
	^ class properties
]

{ #category : #visiting }
MOAngularProtoClass >> setClass: aClass [
	class := aClass 
]

{ #category : #visiting }
MOAngularProtoClass >> sourceCode [
	^ class sourceCode
]

{ #category : #'as yet unclassified' }
MOAngularProtoClass >> superclass [
	^ class superclass 
]

{ #category : #visiting }
MOAngularProtoClass >> tsClass [
	^ class
]
