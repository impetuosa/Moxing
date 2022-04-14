Class {
	#name : #MOStExpressionTypeResolver,
	#superclass : #MOModelExpressionTypeResolver,
	#category : #'Moxing-Linking'
}

{ #category : #visiting }
MOStExpressionTypeResolver >> literalTypeNamed: aName [
  | stringType |
  stringType := model entities select: [:i |  i isType and: [ i name = aName ] ].
  self assert: stringType size <= 1 description: ('Should be only one {1} type!' format: {aName}).
  ^stringType ifEmpty: [ nil ] ifNotEmpty: [ stringType first ]
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitAssignment: aMOAssignment [
  ^aMOAssignment read acceptVisitor: self
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitBlockClosure: aMOStBlockClosure [
  ^aMOStBlockClosure block statements last acceptVisitor: self
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitBooleanLiteral: aMOBooleanLiteral [ 
	^ self literalTypeNamed: #Boolean 
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitCharacterLiteral: aMOCharacterLiteral [ 
	^ self literalTypeNamed: #Character 
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitFloatLiteral: aMOFloatLiteral [ 
	 self subclassResponsibility 
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitIntegerLiteral: aMOIntegerLiteral [
  ^self literalTypeNamed: #Integer
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitMethodInvocation: aMOMethodInvocation [
  ^ nil
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitNullLiteral: aMONullLiteral [ 
	 ^self literalTypeNamed: #UndefinedObject 
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitStArrayExpression: aMOStArrayExpression [
  ^model entities detect: [:a |  a isType and: [ a name = #Array ] ] ifNone: [ nil ]
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitStCascade: aMOStCascade [
  ^aMOStCascade invocations last acceptVisitor: self
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitStatementExpression: aMOStatementExpression [
  ^aMOStatementExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitStringLiteral: aMOStringLiteral [
 	^ self literalTypeNamed: #String 
]

{ #category : #visiting }
MOStExpressionTypeResolver >> visitThisContext: aMOThisContextReference [
  ^model entities detect: [:a |  a isType and: [ a name = #Context ] ] ifNone: [ nil ]
]
