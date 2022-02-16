"
I build Unary boolean operations: not
"
Class {
	#name : #MOModelUnaryBooleanOperationBuilder,
	#superclass : #MOModelUnaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelUnaryBooleanOperationBuilder >> bindingConfiguration [

	"On the left the attribute names for MOUnaryBooleanOperation. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #operator. #operator }.
		  { #operand. #operand }.
		  { #order. #order } }
]

{ #category : #'as yet unclassified' }
MOModelUnaryBooleanOperationBuilder >> buildsType [
<generated>
	^MOUnaryBooleanOperation
]

{ #category : #'as yet unclassified' }
MOModelUnaryBooleanOperationBuilder >> loadBuilderWithEntity: anEntity [ 
	self operator: anEntity operator. 
 self operand: anEntity operand. 
 self order: anEntity order. 
 
	
]

{ #category : #'as yet unclassified' }
MOModelUnaryBooleanOperationBuilder >> privateBuild [

	^ (self instantiate: MOUnaryBooleanOperation)
		  operator: self operator;
		  operand: self operand;
		  order: self order;
		  yourself
]
