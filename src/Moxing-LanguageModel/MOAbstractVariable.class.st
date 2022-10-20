Class {
	#name : #MOAbstractVariable,
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
MOAbstractVariable >> acceptVisitor: aJinTypescriptCodeGenerator [

	self error: 'Abstract is not to be instantiated'
]

{ #category : #adding }
MOAbstractVariable >> addModifier: aModifier [

	modifiers add: aModifier
]

{ #category : #adding }
MOAbstractVariable >> addStatement: aMONewExpression [

	initializer := aMONewExpression
]

{ #category : #accessing }
MOAbstractVariable >> annotationInstances [

	^ annotationInstances
]

{ #category : #accessing }
MOAbstractVariable >> annotationInstances: aCollection [

	annotationInstances := aCollection
]

{ #category : #accessing }
MOAbstractVariable >> bindingKind [

	^ bindingKind
]

{ #category : #adding }
MOAbstractVariable >> bindingKind: aString [ 
	bindingKind := aString
]

{ #category : #adding }
MOAbstractVariable >> canBeReferredAsArrayAccess [

	^ true
]

{ #category : #accessing }
MOAbstractVariable >> canBeReferredAsVariable [

	^ true
]

{ #category : #accessing }
MOAbstractVariable >> dependencies [

	| deps |
	deps := typeReference
		        ifNotNil: [ typeReference dependencies ]
		        ifNil: [ {  } ].
	deps := deps , (annotationInstances
		         ifNil: [ {  } ]
		         ifNotNil: [ annotationInstances flatCollect: #dependencies ]).
	^ initializer
		  ifNil: [ deps ]
		  ifNotNil: [ deps , initializer dependencies ]
]

{ #category : #accessing }
MOAbstractVariable >> initialize [ 
	super initialize.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
MOAbstractVariable >> initializer [
	^ initializer
]

{ #category : #accessing }
MOAbstractVariable >> initializer: aMONewExpression [ 
	initializer := aMONewExpression
]

{ #category : #accessing }
MOAbstractVariable >> isDeclaration [

	^ true
]

{ #category : #testing }
MOAbstractVariable >> isDefinedInLibrary [

	^ self parent isDefinedInLibrary
]

{ #category : #accessing }
MOAbstractVariable >> isDynamicBinding [
	^ self bindingKind = #dynamic.
]

{ #category : #testing }
MOAbstractVariable >> isSharedVariable [
  ^false
]

{ #category : #'as yet unclassified' }
MOAbstractVariable >> isStaticBinding [
	^ self bindingKind = #static.
]

{ #category : #accessing }
MOAbstractVariable >> isVariable [

	^ true
]

{ #category : #accessing }
MOAbstractVariable >> kindString [

	^ 'VAR'
]

{ #category : #'as yet unclassified' }
MOAbstractVariable >> modifiers [

	^ modifiers 
]

{ #category : #'as yet unclassified' }
MOAbstractVariable >> modifiers: aSet [
	modifiers := aSet
]

{ #category : #accessing }
MOAbstractVariable >> printOn: aStream [

	aStream
		nextPutAll: (self enclosingTypeOrModule
				 ifNil: [ self parent name ]
				 ifNotNil: [ :em | em name ]);
		nextPutAll: '>>';
		nextPutAll: self kindString;
		nextPutAll: ':';
		nextPutAll: self name;
		nextPutAll: '('.
	typeReference
		ifNil: [ aStream nextPutAll: ' unknown' ]
		ifNotNil: [ :t | t printOn: aStream ].
	aStream nextPutAll: ')'
]

{ #category : #accessing }
MOAbstractVariable >> senders [

	^ self model references
		  select: [ :r | r candidate isNotNil and: [ self isSameEntity: r candidate ]  ]
		  thenCollect: [ :e | e callingInvocable ]
]

{ #category : #generated }
MOAbstractVariable >> type [

	^ typeReference type
]

{ #category : #accessing }
MOAbstractVariable >> typeReference [
	^ typeReference
]

{ #category : #accessing }
MOAbstractVariable >> typeReference: aJinTypescriptTypeReference [
	typeReference := aJinTypescriptTypeReference
]

{ #category : #accessing }
MOAbstractVariable >> usersOrSenders [

	^ self senders
]
