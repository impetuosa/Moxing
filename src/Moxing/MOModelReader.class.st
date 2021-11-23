Class {
	#name : #MOModelReader,
	#superclass : #Object,
	#instVars : [
		'mapper',
		'model',
		'context',
		'stack',
		'read',
		'contextStack',
		'createdElements'
	],
	#category : #Moxing
}

{ #category : #visiting }
MOModelReader >> initialize [
	super initialize.
	stack := Stack new.
	contextStack := Stack new.
	createdElements := Dictionary new.
]

{ #category : #visiting }
MOModelReader >> instantiate: aClass for: anAlcixFunction [

	| element |
	element := self instantiateLangAware: aClass .
	createdElements at: anAlcixFunction put: element.
	self
		withTop: [ :top | element parent: top ]
		ifEmpty: [ " nothing to set. i am root " ].
	^ element
]

{ #category : #visiting }
MOModelReader >> instantiateLangAware: aClass [ 
		self subclassResponsibility 
]

{ #category : #accessing }
MOModelReader >> mapper: aMOMapper [
	mapper := aMOMapper 
]

{ #category : #accessing }
MOModelReader >> model [
	^ model
]

{ #category : #visiting }
MOModelReader >> push: aValue during: aBlock [

	stack push: aValue.
	^ aBlock ensure: [ stack pop ]
]

{ #category : #visiting }
MOModelReader >> pushContext: aValue during: aBlock [
	contextStack push: aValue.
	^ aBlock
		ensure: [ contextStack pop ]
]

{ #category : #'as yet unclassified' }
MOModelReader >> read: anEntity [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MOModelReader >> read: anAlcixFunction context: aMOClass of: aMOModel [
	model := aMOModel derivative.
	mapper
		destinationContext: aMOClass;
		destinationModel: aMOModel derivative.
	^ self read: anAlcixFunction
]

{ #category : #visiting }
MOModelReader >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOModelReader >> visitCollection: entries contextualingWith: contexts [

	^ entries
		  with: contexts
		  collect: [ :e :c | 
		  self pushContext: c during: [ e acceptVisitor: self ] ]
]

{ #category : #visiting }
MOModelReader >> withCurrentContext: aBlock [

	^ self withCurrentContext: aBlock ifEmpty: [ self error: 'Stack is empty!' ]
]

{ #category : #visiting }
MOModelReader >> withCurrentContext: aBlock ifEmpty: aanEmptyBlock [

	^ contextStack
		  ifEmpty: aanEmptyBlock
		  ifNotEmpty: [ aBlock value: contextStack top ]
]

{ #category : #visiting }
MOModelReader >> withTop: aBlock [

	^ self withTop: aBlock ifEmpty: [ self error: 'Stack is empty!' ]
]

{ #category : #visiting }
MOModelReader >> withTop: aBlock ifEmpty: aanEmptyBlock [

	^ stack
		  ifEmpty: aanEmptyBlock
		  ifNotEmpty: [ aBlock value: stack top ]
]
