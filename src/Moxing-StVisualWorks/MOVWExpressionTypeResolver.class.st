Class {
	#name : #MOVWExpressionTypeResolver,
	#superclass : #MOStExpressionTypeResolver,
	#category : #'Moxing-StVisualWorks-Linking'
}

{ #category : #visiting }
MOVWExpressionTypeResolver >> visitArrayLiteral: aMOArrayLiteral [ 
	^ self literalTypeNamed: #Array 
]

{ #category : #visiting }
MOVWExpressionTypeResolver >> visitFloatLiteral: aMOFloatLiteral [ 
	^ self literalTypeNamed: #LimitedPrecisionReal 
]
