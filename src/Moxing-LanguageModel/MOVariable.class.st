Class {
	#name : #MOVariable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#modifiers => MOPropertySlot',
		'#typeReference => MOReferenceSlot one',
		'#initializer => MOExpressionSlot one',
		'#annotationInstances => MOReferenceSlot many',
		'#bindingKind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitVariable: self
]

{ #category : #adding }
MOVariable >> addModifier: aModifier [

	modifiers add: aModifier
]

{ #category : #adding }
MOVariable >> addStatement: aMONewExpression [

	initializer := aMONewExpression
]

{ #category : #accessing }
MOVariable >> annotationInstances: aCollection [

	annotationInstances := aCollection
]

{ #category : #accessing }
MOVariable >> bindingKind [

	^ bindingKind
]

{ #category : #adding }
MOVariable >> bindingKind: aString [ 
	bindingKind := aString
]

{ #category : #accessing }
MOVariable >> dependencies [
	| deps |
	deps := typeReference ifNotNil: [ typeReference dependencies ] ifNil: [ {} ].
	^ initializer 
		ifNil: [ deps ]
		ifNotNil: [ deps , initializer dependencies ]
]

{ #category : #accessing }
MOVariable >> initialize [ 
	super initialize.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
MOVariable >> initializer [
	^ initializer
]

{ #category : #accessing }
MOVariable >> initializer: aMONewExpression [ 
	initializer := aMONewExpression
]

{ #category : #accessing }
MOVariable >> isDynamicBinding [
	^ self bindingKind = #dynamic.
]

{ #category : #'as yet unclassified' }
MOVariable >> isStaticBinding [
	^ self bindingKind = #static.
]

{ #category : #accessing }
MOVariable >> isVariable [

	^ true
]

{ #category : #accessing }
MOVariable >> kindString [

	^ 'VAR'
]

{ #category : #'as yet unclassified' }
MOVariable >> modifiers [

	^ modifiers 
]

{ #category : #'as yet unclassified' }
MOVariable >> modifiers: aSet [
	modifiers := aSet
]

{ #category : #accessing }
MOVariable >> printOn: aStream [

	aStream
		nextPutAll: self kindString;
		nextPutAll: ':';
		nextPutAll: name;
		nextPutAll: '('.
	typeReference
		ifNil: [ aStream nextPutAll: ' unknown' ]
		ifNotNil: [ :t | t printOn: aStream ].
	aStream nextPutAll: ')'
]

{ #category : #generated }
MOVariable >> type [

	^ typeReference type
]

{ #category : #accessing }
MOVariable >> typeReference [
	^ typeReference
]

{ #category : #accessing }
MOVariable >> typeReference: aJinTypescriptTypeReference [
	typeReference := aJinTypescriptTypeReference
]
