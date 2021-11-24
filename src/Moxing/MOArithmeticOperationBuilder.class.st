Class {
	#name : #MOArithmeticOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOArithmeticOperationBuilder >> build [

	^ (self instantiate: MOBinaryArithmeticOperation)
		  operator: operator;
		  left: left;
		  right: right;
		  yourself
]
