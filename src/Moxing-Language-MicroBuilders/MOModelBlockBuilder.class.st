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
	#category : #'Moxing-Language-MicroBuilders-core'
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

	aStatement isCollection ifTrue: [ 
		aStatement do: [ :a | self addStatement: a ].
		^ self ].
	(aStatement isKindOf: MOJavaFileLoader) ifTrue: [ ^ self ].
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

{ #category : #generated }
MOModelBlockBuilder >> flattenedStatements [

	^ statements flatCollect: [ :a | 
		  a isCollection
			  ifTrue: [ a ]
			  ifFalse: [ { a } ] ]
]

{ #category : #accessing }
MOModelBlockBuilder >> instantiate: aClass [

	self isUpdating ifTrue: [ 
		updatingEntity species = MOEmptyBlock ifTrue: [ 
			^ self statements
				  ifEmpty: [ updatingEntity ]
				  ifNotEmpty: [ parentBuilder instantiate: aClass ] ].

		self assert: updatingEntity species = self buildsType.
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
				         statements: self flattenedStatements;
				         yourself ].

	self flattenedStatements do: [ :s | s parent: block ].
	^ block
]

{ #category : #removing }
MOModelBlockBuilder >> remove: aMOAlceExit [

	| st |
	self assert: self isUpdating.
	st := self instantiateSubClass: MORemovedStatement.
	st parent: updatingEntity.
	st statement: aMOAlceExit.
	self statements replaceAll: aMOAlceExit with: st.
	^ st
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
