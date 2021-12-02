Class {
	#name : #MOModelUnaryOperationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'operator',
		'operand',
		'order'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelUnaryOperationBuilder >> operand [

	^ operand ifNil: [ self error: 'Operand is Nil' ]
]

{ #category : #accessing }
MOModelUnaryOperationBuilder >> operand: aMOVariableReference [ 
	operand := aMOVariableReference
]

{ #category : #accessing }
MOModelUnaryOperationBuilder >> operator [

	^ operator ifNil: [ self error: ' Operator is Nil' ]
]

{ #category : #accessing }
MOModelUnaryOperationBuilder >> operator: aString [ 
	operator := aString
]

{ #category : #accessing }
MOModelUnaryOperationBuilder >> order [

	^ order ifNil: [ order := #postfix ]
]
