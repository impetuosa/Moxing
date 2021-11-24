Class {
	#name : #MOModelBinaryOperationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'operator',
		'left',
		'right'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelBinaryOperationBuilder >> left [
	^ left ifNil: [ self error: ' Left operand is Nil ' ]
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> left: aMOVariableReference [ 
	left := aMOVariableReference
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> operator [

	^ operator ifNil: [ self error: ' Operator is Nil ' ]
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> operator: aString [ 
	operator := aString
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> right [
	^ right ifNil: [ self error: ' Rigth operand is Nil ' ]
]

{ #category : #accessing }
MOModelBinaryOperationBuilder >> right: aMOVariableReference [ 
	right := aMOVariableReference
]
