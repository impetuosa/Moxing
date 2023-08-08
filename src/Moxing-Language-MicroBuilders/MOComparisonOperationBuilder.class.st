"
I know how to build a comparison operation (such as > < == , etc) 
"
Class {
	#name : #MOComparisonOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-Language-MicroBuilders-expressions'
}

{ #category : #'as yet unclassified' }
MOComparisonOperationBuilder >> buildsType [
<generated>
	^MOBinaryComparisonOperation
]
