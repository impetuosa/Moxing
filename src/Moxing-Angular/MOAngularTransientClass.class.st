Class {
	#name : #MOAngularTransientClass,
	#superclass : #MOTransientEntity,
	#instVars : [
		'module',
		'class'
	],
	#category : #'Moxing-Angular-TransientModel'
}

{ #category : #visiting }
MOAngularTransientClass >> acceptVisitor: aVisitor [
	aVisitor visitAngularProtoClass: self . 
	
]

{ #category : #'as yet unclassified' }
MOAngularTransientClass >> dependencies [
	^ {(MOFileImport new
		type: class;
		from: self importingPath;
		yourself)},  class dependencies
]

{ #category : #'as yet unclassified' }
MOAngularTransientClass >> importingPath [
	^ './{1}' format: {class name}
]

{ #category : #'as yet unclassified' }
MOAngularTransientClass >> interfaces [
	^ class types 
]

{ #category : #'as yet unclassified' }
MOAngularTransientClass >> methods [
	^ class methods 
]

{ #category : #visiting }
MOAngularTransientClass >> module [
	^ module
]

{ #category : #visiting }
MOAngularTransientClass >> module: aModule [ 	
	module := aModule 
]

{ #category : #visiting }
MOAngularTransientClass >> name [
	^ class name 
]

{ #category : #visiting }
MOAngularTransientClass >> printOn: aStream [
	class name printOn: aStream
]

{ #category : #'as yet unclassified' }
MOAngularTransientClass >> properties [
	^ class properties
]

{ #category : #'as yet unclassified' }
MOAngularTransientClass >> save [
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
MOAngularTransientClass >> setClass: aClass [
	class := aClass 
]

{ #category : #visiting }
MOAngularTransientClass >> sourceCode [
	^ class sourceCode
]

{ #category : #'as yet unclassified' }
MOAngularTransientClass >> superclass [
	^ class superclass 
]

{ #category : #visiting }
MOAngularTransientClass >> tsClass [
	^ class
]
