"
I know how to build a comparison operation (such as > < == , etc) 
"
Class {
	#name : #MOComparisonOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOComparisonOperationBuilder >> bindingConfiguration [

	"On the left the attribute names for MOBinaryComparisonOperation. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #operator. #operator }.
		  { #left. #left }.
		  { #right. #right } }
]

{ #category : #'as yet unclassified' }
MOComparisonOperationBuilder >> buildsType [
<generated>
	^MOBinaryComparisonOperation
]

{ #category : #'as yet unclassified' }
MOComparisonOperationBuilder >> loadBuilderWithEntity: anEntity [ 
	self operator: anEntity operator. 
 self left: anEntity left. 
 self right: anEntity right. 
 
	
]

{ #category : #'as yet unclassified' }
MOComparisonOperationBuilder >> privateBuild [

	^ (self instantiate: MOBinaryComparisonOperation)
		  operator: self operator;
		  left: self left;
		  right: self right;
		  yourself
]
