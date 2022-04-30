Class {
	#name : #MOPhExpressionTypeResolver,
	#superclass : #MOStExpressionTypeResolver,
	#category : #'Moxing-StPharo-Linking'
}

{ #category : #visiting }
MOPhExpressionTypeResolver >> visitArrayLiteral: aMOArrayLiteral [
  ^self visitStArrayExpression: aMOArrayLiteral
]

{ #category : #visiting }
MOPhExpressionTypeResolver >> visitFloatLiteral: aMOFloatLiteral [ 
	^ self literalTypeNamed: #Float 
]
