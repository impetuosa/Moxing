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

{ #category : #visiting }
MOAngularProtoClass >> module [
	^ module
]

{ #category : #visiting }
MOAngularProtoClass >> module: aModule [ 	
	module := aModule 
]

{ #category : #visiting }
MOAngularProtoClass >> setClass: aClass [
	class := aClass 
]

{ #category : #visiting }
MOAngularProtoClass >> tsClass [
	^ class
]
