Class {
	#name : #MOModelUnaryArithmeticOperationBuilder,
	#superclass : #MOModelUnaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelUnaryArithmeticOperationBuilder >> build [

	^ (self instantiate: MOUnaryArithmeticOperation)
		  operator: self operator;
		  operand: self operand;
		  order: self order;
		  yourself
]
