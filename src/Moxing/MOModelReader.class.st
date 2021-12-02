Class {
	#name : #MOModelReader,
	#superclass : #Object,
	#instVars : [
		'mapper',
		'model',
		'context',
		'read',
		'contextStack',
		'trace',
		'writer'
	],
	#category : #Moxing
}

{ #category : #visiting }
MOModelReader >> initialize [
	super initialize.
	contextStack := Stack new.
	trace := Set new.
]

{ #category : #visiting }
MOModelReader >> instantiate: aClass for: anAlcixFunction [

	| element |
	element := self instantiateLangAware: aClass .
	trace at: anAlcixFunction put: element.
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
	writer := aMOModel writer. 
	mapper
		destinationContext: aMOClass;
		destinationModel: aMOModel.
	^ self read: anAlcixFunction
]

{ #category : #accessing }
MOModelReader >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	aBlock ensure: [ writer := prev ]
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
