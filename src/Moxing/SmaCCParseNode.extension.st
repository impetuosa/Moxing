Extension { #name : #SmaCCParseNode }

{ #category : #'*Moxing' }
SmaCCParseNode >> accept: aMOJavaMooseBasedLoaderPhase2 [

	^ self acceptVisitor: aMOJavaMooseBasedLoaderPhase2
]

{ #category : #'*Moxing' }
SmaCCParseNode >> enclosing: aClass [ 
	^ self enclosing: aClass starting: parent 
]

{ #category : #'*Moxing' }
SmaCCParseNode >> enclosing: aClass starting: start [

	| current |
	current := start.
	[ current isNil ] whileFalse: [ 
		current class = aClass ifTrue: [ ^ current ].
		current := current parent ].
	self error: 'No enclosing this node '
]
