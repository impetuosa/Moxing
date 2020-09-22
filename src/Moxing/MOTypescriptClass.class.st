Class {
	#name : #MOTypescriptClass,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'types',
		'methods',
		'superclass',
		'properties',
		'decorator'
	],
	#classInstVars : [
		'object'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #accessing }
MOTypescriptClass class >> object [

	^ object ifNil: [ 
		  object := MOTypescriptTypeReference new
			            name: #Object;
			            yourself ]
]

{ #category : #visiting }
MOTypescriptClass >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptClass: self .
]

{ #category : #adding }
MOTypescriptClass >> addMethod: aJinTypescriptMethod [ 
	methods  add: aJinTypescriptMethod .
	aJinTypescriptMethod setOwnerClass: self . 
]

{ #category : #accessing }
MOTypescriptClass >> decorator [

	^ decorator
]

{ #category : #accessing }
MOTypescriptClass >> decorator: aDeco [

	decorator := aDeco
]

{ #category : #generated }
MOTypescriptClass >> implements: aCollection [ 
	types := aCollection 
]

{ #category : #generated }
MOTypescriptClass >> initialize [ 
	super initialize .
	methods := OrderedCollection new .
	properties := OrderedCollection new. 
]

{ #category : #accessing }
MOTypescriptClass >> methods [
	^ methods
]

{ #category : #accessing }
MOTypescriptClass >> parents [
	self shouldBeImplemented.
]

{ #category : #accessing }
MOTypescriptClass >> properties [
	^ properties 
]

{ #category : #accessing }
MOTypescriptClass >> superclass [

	^ superclass ifNil: [ superclass := self class object  ]
]

{ #category : #accessing }
MOTypescriptClass >> types [
	^ types
]
