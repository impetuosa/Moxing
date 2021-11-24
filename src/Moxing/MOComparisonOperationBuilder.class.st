Class {
	#name : #MOComparisonOperationBuilder,
	#superclass : #MOModelBinaryOperationBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOComparisonOperationBuilder >> build [

	^ (self instantiate: MOBinaryComparisonOperation)
		  operator: self operator;
		  left: self left;
		  right: self right;
		  yourself
]
