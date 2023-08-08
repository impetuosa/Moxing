"
i build set-to-returns 
"
Class {
	#name : #MOModelSetToReturnBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'returns'
	],
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelSetToReturnBuilder >> buildsType [
<generated>
	^MOSetToReturn
]

{ #category : #generated }
MOModelSetToReturnBuilder >> expression: anExpression [

	self returns: anExpression
]

{ #category : #'as yet unclassified' }
MOModelSetToReturnBuilder >> loadBuilderWithEntity: anEntity [ 
	self returns: anEntity expression. 
 
	
]

{ #category : #'as yet unclassified' }
MOModelSetToReturnBuilder >> privateBuild [

	^ (self instantiate: MOSetToReturn)
		  expression: self returns;
		  yourself
]

{ #category : #generated }
MOModelSetToReturnBuilder >> returns [
	 ^ returns ifNil: [ self error: ' An expression must be set to return ' ]
]

{ #category : #accessing }
MOModelSetToReturnBuilder >> returns: aMOBinaryArithmeticOperation [ 
	returns := aMOBinaryArithmeticOperation
]
