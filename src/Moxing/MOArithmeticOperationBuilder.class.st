Class {
	#name : #MOArithmeticOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOArithmeticOperationBuilder >> privateBuild [

	^ (self instantiate: MOBinaryArithmeticOperation)
		  operator: operator;
		  left: left;
		  right: right;
		  yourself
]
