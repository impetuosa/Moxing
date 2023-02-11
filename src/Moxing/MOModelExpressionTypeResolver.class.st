Class {
	#name : #MOModelExpressionTypeResolver,
	#superclass : #MOModelDeclarationResolver,
	#instVars : [
		'resolving',
		'model'
	],
	#category : #'Moxing-Linking'
}

{ #category : #accessing }
MOModelExpressionTypeResolver >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelExpressionTypeResolver >> typeOfExpression: aMOObject [

	^ aMOObject acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitArrayAccess: aMOArrayAccess [

	^ aMOArrayAccess referee
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitAssignment: aMOAssignment [

	^ aMOAssignment read acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitAttributeAccess: aMOAttributeAccess [

	^ aMOAttributeAccess referee ifNotNil: [ :c | 
		  c typeReference ifNotNil: [ :e | e referee ] ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	^ aMOBinaryArithmeticOperation parent acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitBlockClosure: aMOLambda [

	^ nil
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitCastExpression: aMOCastExpression [

	^ aMOCastExpression parent acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitConditionalExpression: aMOConditionalExpression [

	^ nil
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitIntegerLiteral: aMOIntegerLiteral [ 
	self subclassResponsibility 
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitMethodInvocation: aMOMethodInvocation [

	^ aMOMethodInvocation referee ifNotNil: [ :c | 
		  c returnTypeReference ifNotNil: [ :rt | rt referee ] ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitNewExpression: aMONewInvocation [

	^ aMONewInvocation typeReference acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitSelfReference: aMOSelfReference [

	| classOrExtension |
	classOrExtension := aMOSelfReference callingClass.
	classOrExtension ifNil: [ ^ nil ].
	^ classOrExtension isMethodExtension
		  ifTrue: [ classOrExtension classReference referee ]
		  ifFalse: [ classOrExtension ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitStringLiteral: aMOStringLiteral [

	^ [ model typeNamed: #String ]
		  on: Error
		  do: [ nil ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitTypeReference: aMOTypeReference [
  ^aMOTypeReference referee
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitVariableReference: aMOVariableReference [
  ^aMOVariableReference referee ifNotNil: [:c |  c typeReference ifNotNil: [:e |  e referee ] ]
]
