"
I build Unary arithmetic operations: 

1!
"
Class {
	#name : #MOModelUnaryArithmeticOperationBuilder,
	#superclass : #MOModelUnaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelUnaryArithmeticOperationBuilder >> bindingConfiguration [

	"On the left the attribute names for MOUnaryArithmeticOperation. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #operator. #operator }.
		  { #operand. #operand }.
		  { #order. #order } }
]

{ #category : #'as yet unclassified' }
MOModelUnaryArithmeticOperationBuilder >> buildsType [
<generated>
	^MOUnaryArithmeticOperation
]

{ #category : #'as yet unclassified' }
MOModelUnaryArithmeticOperationBuilder >> loadBuilderWithEntity: anEntity [ 
	self operator: anEntity operator. 
 self operand: anEntity operand. 
 self order: anEntity order. 
 
	
]

{ #category : #'as yet unclassified' }
MOModelUnaryArithmeticOperationBuilder >> privateBuild [

	^ (self instantiate: MOUnaryArithmeticOperation)
		  operator: self operator;
		  operand: self operand;
		  order: self order;
		  yourself
]
