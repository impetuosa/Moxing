Class {
	#name : #MOComparisonOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOComparisonOperationBuilder >> privateBuild [

	^ (self instantiate: MOBinaryComparisonOperation)
		  operator: self operator;
		  left: self left;
		  right: self right;
		  yourself
]
