"
I know how to build a boolean operation (such as and or xor, etc) 
"
Class {
	#name : #MOArithmeticBooleanOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOArithmeticBooleanOperationBuilder >> bindingConfiguration [

	"On the left the attribute names for MOBinaryBooleanOperation. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #operator. #operator }.
		  { #left. #left }.
		  { #right. #right } }
]

{ #category : #'as yet unclassified' }
MOArithmeticBooleanOperationBuilder >> buildsType [
<generated>
	^MOBinaryBooleanOperation
]

{ #category : #'as yet unclassified' }
MOArithmeticBooleanOperationBuilder >> loadBuilderWithEntity: anEntity [ 
	self operator: anEntity operator. 
 self left: anEntity left. 
 self right: anEntity right. 
 
	
]

{ #category : #'as yet unclassified' }
MOArithmeticBooleanOperationBuilder >> privateBuild [

	^ (self instantiate: MOBinaryBooleanOperation)
		  operator: self operator;
		  left: self left;
		  right: self right;
		  yourself
]
