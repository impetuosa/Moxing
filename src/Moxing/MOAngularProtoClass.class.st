Class {
	#name : #MOAngularProtoClass,
	#superclass : #MOAngularProtoEntity,
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
MOAngularProtoClass >> dependencies [
	^ {(MOTypescriptDependency new
		type: class;
		from: self importingPath;
		yourself)},  class dependencies
]

{ #category : #'as yet unclassified' }
MOAngularProtoClass >> importingPath [
	^ './{1}' format: {class name}
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

{ #category : #visiting }
MOAngularProtoClass >> printOn: aStream [
	class name printOn: aStream
]

{ #category : #'as yet unclassified' }
MOAngularProtoClass >> properties [
	^ class properties
]

{ #category : #'as yet unclassified' }
MOAngularProtoClass >> save [
	| ref |
	self assert: (module components includes: self).
	ref := module path / ('{1}.ts' format: {class name}).
	ref exists
		ifTrue: [ ^ self ].
	ref writeStream
		nextPutAll: class sourceCode;
		close
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
