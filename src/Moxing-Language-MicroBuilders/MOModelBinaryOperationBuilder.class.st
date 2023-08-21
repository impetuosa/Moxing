"
I build binary operations in general .
"
Class {
	#name : #MOModelBinaryOperationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'operator',
		'left',
		'right'
	],
	#category : #'Moxing-Language-MicroBuilders-Expressions'
}

{ #category : #accessing }
MOModelBinaryOperationBuilder >> left [

	^ (left ifNil: [ self error: ' Left operand is Nil ' ]) value
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> left: aMOVariableReference [ 
	left := aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOModelBinaryOperationBuilder >> loadBuilderWithEntity: anEntity [

	self operator: anEntity operator.
	self left: anEntity left.
	self right: anEntity right
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> operator [

	^ operator ifNil: [ self error: ' Operator is Nil ' ]
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> operator: aString [ 
	operator := aString
]

{ #category : #'as yet unclassified' }
MOModelBinaryOperationBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  operator: self operator;
		  left: self left;
		  right: self right;
		  yourself
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> right [
	^ (right ifNil: [ self error: ' Rigth operand is Nil ' ]) value 
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> right: aMOVariableReference [ 
	right := aMOVariableReference
]
