"
I am in charge of binding the invocation with a mehtod/ function declaration 
"
Class {
	#name : #MOModelInvocationLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Linking'
}

{ #category : #'as yet unclassified' }
MOModelInvocationLinker >> lookupMethodFor: aMOMethodInvocation [

	^ MOModelMethodLookup new lookupMethodFor: aMOMethodInvocation
]

{ #category : #accessing }
MOModelInvocationLinker >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelInvocationLinker >> processInvocation: aMOAnnotationInstance [

	resolving := aMOAnnotationInstance.
	aMOAnnotationInstance acceptVisitor: self
]

{ #category : #visiting }
MOModelInvocationLinker >> visitAnnotation: aMOAnnotationInstance [

	| pc |
	self assert: resolving = aMOAnnotationInstance.
	aMOAnnotationInstance typeReference candidate ifNotNil: [ 
		:annotationType | 
		annotationType constructors
			detect: [ :c | 
			c parameters size = aMOAnnotationInstance arguments size ]
			ifFound: [ :c | resolving candidate: c ] ]
]

{ #category : #visiting }
MOModelInvocationLinker >> visitMethodInvocation: aMOMethodInvocation [

	| possible |
	self assert: aMOMethodInvocation = resolving.
	possible := self lookupMethodFor: aMOMethodInvocation.
	self assert: possible size = 1.
	possible ifNotEmpty: [ resolving candidate: possible first ]
]

{ #category : #visiting }
MOModelInvocationLinker >> visitNewExpression: aMONewExpression [

	| possible |
	self assert: aMONewExpression = resolving.
	aMONewExpression typeReference candidate ifNotNil: [ :type | 
		possible := type constructors select: [ :c | 
			            c parameters size = aMONewExpression arguments size ].
		self assert: possible size < 2.
		possible ifNotEmpty: [ resolving candidate: possible first ] ]
]
