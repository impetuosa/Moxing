"
I know how to build a block. I allow adding statements one at the time, all together,  on the beginning or at the end of the statements list 
"
Class {
	#name : #MOModelBlockBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'statements',
		'isAddingStatemntsAtFirst'
	],
	#category : #'Moxing-MicroBuilders-core'
}

{ #category : #adding }
MOModelBlockBuilder >> addExpressionStatement: aMOVariable [

	^ self addStatement: (parentBuilder statementExpressionBuilder
			   expression: aMOVariable;
			   build)
]

{ #category : #generated }
MOModelBlockBuilder >> addFirstStatement: aStatement [

	self statements addFirst: aStatement.
]

{ #category : #generated }
MOModelBlockBuilder >> addLastStatement: aStatement [

	self statements addLast: aStatement.
]

{ #category : #adding }
MOModelBlockBuilder >> addLocalVariable: aMOLocalVariable [

	self addStatement: aMOLocalVariable
]

{ #category : #generated }
MOModelBlockBuilder >> addStatement: aStatement [
	aStatement ifNil: [ self halt ].
	self isAddingStatemntsAtFirst
		ifTrue: [ self addFirstStatement: aStatement ]
		ifFalse: [ self addLastStatement: aStatement ]
]

{ #category : #'as yet unclassified' }
MOModelBlockBuilder >> buildsType [
<generated>
	^MOBlock
]

{ #category : #accessing }
MOModelBlockBuilder >> instantiate: aClass [

	self isUpdating ifTrue: [ 
		(updatingEntity isKindOf: MOEmptyBlock) ifTrue: [ 
			^ self statements
				  ifEmpty: [ updatingEntity ]
				  ifNotEmpty: [ parentBuilder instantiate: aClass ] ].

		self assert: updatingEntity class = self buildsType.
		^ updatingEntity ].
	^ parentBuilder instantiate: aClass
]

{ #category : #accessing }
MOModelBlockBuilder >> isAddingStatemntsAtFirst [

	^ isAddingStatemntsAtFirst ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
MOModelBlockBuilder >> loadBuilderWithEntity: anEntity [ 
	self statements: anEntity statements asOrderedCollection . 
 
	
]

{ #category : #'as yet unclassified' }
MOModelBlockBuilder >> privateBuild [

	| block |
	block := self statements
		         ifEmpty: [ self instantiate: MOEmptyBlock ]
		         ifNotEmpty: [ 
			         (self instantiate: MOBlock)
				         statements: self statements;
				         yourself ].

	self statements do: [ :s | s parent: block ].
	^ block
]

{ #category : #initialization }
MOModelBlockBuilder >> setAddingStatemntsAtFirst [
	isAddingStatemntsAtFirst := true 
]

{ #category : #generated }
MOModelBlockBuilder >> statements [

	^ statements ifNil: [ statements := OrderedCollection new ]
]

{ #category : #accessing }
MOModelBlockBuilder >> statements: aCollection [

"	statements ifNotNil: [ statements isEmpty ifFalse: [ self halt ] ]."
	statements := aCollection
]