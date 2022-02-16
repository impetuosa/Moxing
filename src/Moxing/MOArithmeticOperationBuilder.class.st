"
I know how to build a arithmetic operation (such as + - * etc) 
"
Class {
	#name : #MOArithmeticOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOArithmeticOperationBuilder >> bindingConfiguration [

	"On the left the attribute names for MOBinaryArithmeticOperation. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #operator. #operator }.
		  { #left. #left }.
		  { #right. #right } }
]

{ #category : #'as yet unclassified' }
MOArithmeticOperationBuilder >> buildsType [
<generated>
	^MOBinaryArithmeticOperation
]

{ #category : #'as yet unclassified' }
MOArithmeticOperationBuilder >> loadBuilderWithEntity: anEntity [ 
	self operator: anEntity operator. 
 self left: anEntity left. 
 self right: anEntity right. 
 
	
]

{ #category : #'as yet unclassified' }
MOArithmeticOperationBuilder >> privateBuild [

	^ (self instantiate: MOBinaryArithmeticOperation)
		  operator: self operator;
		  left: self left;
		  right: self right;
		  yourself
]
