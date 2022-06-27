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
MOModelExpressionTypeResolver >> visitIntegerLiteral: aMOIntegerLiteral [ 
	self subclassResponsibility 
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitMethodInvocation: aMOMethodInvocation [
  ^aMOMethodInvocation candidate ifNotNil: [:c |  c returnTypeReference ifNotNil: [:rt |  rt candidate ] ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitSelfReference: aMOSelfReference [

	| classOrExtension |
	classOrExtension := aMOSelfReference callingClass.
	^ classOrExtension isMethodExtension
		  ifTrue: [ classOrExtension classReference candidate ]
		  ifFalse: [ classOrExtension ]
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitStringLiteral: aMOStringLiteral [ 
	^ self subclassResponsibility  
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitTypeReference: aMOTypeReference [
  ^aMOTypeReference candidate
]

{ #category : #visiting }
MOModelExpressionTypeResolver >> visitVariableReference: aMOVariableReference [
  ^aMOVariableReference candidate ifNotNil: [:c |  c typeReference ifNotNil: [:e |  e candidate ] ]
]
