Class {
	#name : #MOModelUnaryArithmeticOperationBuilder,
	#superclass : #MOModelUnaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelUnaryArithmeticOperationBuilder >> privateBuild [

	^ (self instantiate: MOUnaryArithmeticOperation)
		  operator: self operator;
		  operand: self operand;
		  order: self order;
		  yourself
]
