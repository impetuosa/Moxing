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
  ^aMOObject acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitAttributeAccess: aMOAttributeAccess [

	^ aMOAttributeAccess referee ifNotNil: [ :c | 
		  c typeReference ifNotNil: [ :e | e referee ] ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitIntegerLiteral: aMOIntegerLiteral [ 
	self subclassResponsibility 
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitMethodInvocation: aMOMethodInvocation [
  ^aMOMethodInvocation referee ifNotNil: [:c |  c returnTypeReference ifNotNil: [:rt |  rt referee ] ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitSelfReference: aMOSelfReference [

	| classOrExtension |
	classOrExtension := aMOSelfReference callingClass.
	^ classOrExtension isMethodExtension
		  ifTrue: [ classOrExtension classReference referee ]
		  ifFalse: [ classOrExtension ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitStringLiteral: aMOStringLiteral [

	^ model typeNamed: #String
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitTypeReference: aMOTypeReference [
  ^aMOTypeReference referee
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitVariableReference: aMOVariableReference [
  ^aMOVariableReference referee ifNotNil: [:c |  c typeReference ifNotNil: [:e |  e referee ] ]
]
