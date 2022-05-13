"
I am in charge of binding the invocation with a mehtod/ function declaration 
"
Class {
	#name : #MOModelInvocationResolver,
	#superclass : #MOModelDeclarationResolver,
	#instVars : [
		'model',
		'resolving',
		'expressionTypeResolvingStrategy',
		'methodLookupStrategy'
	],
	#category : #'Moxing-Linking'
}

{ #category : #'as yet unclassified' }
MOModelInvocationResolver >> expressionTypeResolvingStrategy [
  ^expressionTypeResolvingStrategy ifNil: [ expressionTypeResolvingStrategy := model language expressionTypeResolvingStrategy new
           model: model;
           yourself ]
]

{ #category : #'as yet unclassified' }
MOModelInvocationResolver >> lookupMethodFor: aMOMethodInvocation [
  | receiver |
  receiver := self expressionTypeResolvingStrategy typeOfExpression: aMOMethodInvocation receiverReference.
  receiver ifNil: [ ^{} ].
  ^self methodLookupStrategy lookMethodFor: aMOMethodInvocation in: receiver
]

{ #category : #'instance creation' }
MOModelInvocationResolver >> methodLookupStrategy [
  ^methodLookupStrategy ifNil: [ methodLookupStrategy := model language methodLookupStrategy new ]
]

{ #category : #accessing }
MOModelInvocationResolver >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelInvocationResolver >> processInvocation: aMOAnnotationInstance [

	resolving := aMOAnnotationInstance.
	aMOAnnotationInstance acceptVisitor: self
]

{ #category : #visiting }
MOModelInvocationResolver >> visitAnnotation: aMOAnnotationInstance [


	self assert: resolving = aMOAnnotationInstance.
	aMOAnnotationInstance typeReference candidate ifNotNil: [ 
		:annotationType | 
		annotationType constructors
			detect: [ :c | 
			c parameters size = aMOAnnotationInstance arguments size ]
			ifFound: [ :c | resolving candidate: c ] ]
]

{ #category : #visiting }
MOModelInvocationResolver >> visitInvocation: aMOInvocation [ 

]

{ #category : #visiting }
MOModelInvocationResolver >> visitMethodInvocation: aMOMethodInvocation [

	| possible |
	self assert: aMOMethodInvocation = resolving.
	possible := self lookupMethodFor: aMOMethodInvocation.
	self assert: possible size <= 1.
	possible ifNotEmpty: [ resolving candidate: possible first ]
]

{ #category : #visiting }
MOModelInvocationResolver >> visitNewExpression: aMONewExpression [

	| possible |
	self assert: aMONewExpression = resolving.
	aMONewExpression typeReference candidate ifNotNil: [ :type | 
		possible := type constructors select: [ :c | 
			            c parameters size = aMONewExpression arguments size ].
		self assert: possible size < 2.
		possible ifNotEmpty: [ resolving candidate: possible first ] ]
]
