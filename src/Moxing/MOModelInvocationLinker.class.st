Class {
	#name : #MOModelInvocationLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Core'
}

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
	possible := aMOMethodInvocation receiverReference candidate
		            typeReference candidate allMethods select: [ :m | 
		            m selector = aMOMethodInvocation selector ].
	self assert: possible size < 2.
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
