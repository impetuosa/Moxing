Extension { #name : #PSQLASTNode }

{ #category : #'*Moxing-Alce' }
PSQLASTNode >> children [
	| children |
	children := OrderedCollection streamContents: [ :stream | 
			self instanceVariableNamesToChildrenDo: [ :instVarName :nodeOrCollection |
				stream nextPutAll: nodeOrCollection asOrderedCollection ] ].
	children := children reject: #isArray.
	(children allSatisfy: [ :node | node startPosition isNotNil and: [ node endPosition isNotNil ] ])
		ifFalse: [ 
			Warning signal: 'All positions of children are not set. Returning unordered children.'.
			^ children ].

	^ children sort: [ :nodeA :nodeB |
		nodeA startPosition < nodeB startPosition
			and: [ nodeA endPosition < nodeB endPosition ] ]
]
