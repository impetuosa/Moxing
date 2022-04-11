Class {
	#name : #MOVWExpressionTypeResolver,
	#superclass : #MOStExpressionTypeResolver,
	#category : #'Moxing-Linking'
}

{ #category : #visiting }
MOVWExpressionTypeResolver >> visitArrayLiteral: aMOArrayLiteral [ 
	^ self literalTypeNamed: #Array 
]

{ #category : #visiting }
MOVWExpressionTypeResolver >> visitFloatLiteral: aMOFloatLiteral [ 
	^ self literalTypeNamed: #LimitedPrecisionReal 
]
