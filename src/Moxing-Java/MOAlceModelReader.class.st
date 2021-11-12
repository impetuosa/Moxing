Class {
	#name : #MOAlceModelReader,
	#superclass : #MOModelReader,
	#instVars : [
		'stack',
		'read',
		'contextStack',
		'createdElements'
	],
	#category : #'Moxing-Java-Writer'
}

{ #category : #'as yet unclassified' }
MOAlceModelReader >> getInvocationForNonResolvedCall: aVBProcedureCallOrArrayAccessNode [

	| args |
	args := self
		        pushContext: nil
		        during: [ 
		        aVBProcedureCallOrArrayAccessNode arguments acceptVisitor:
			        self ].
	^ self withCurrentContext: [ :ctx | 
		  mapper
			  getInvocationForNonResolvedCall:
			  (aVBProcedureCallOrArrayAccessNode selector acceptVisitor: self)
			  arguments: args
			  invocationContext: ctx ]
]

{ #category : #'as yet unclassified' }
MOAlceModelReader >> hackieVariableReference: name for: aMpped [

	| element candidate |
	element := createdElements values
		           detect: [ :v | v name = name ]
		           ifFound: [ :e | 
			           element := self
				                      instantiate: MOVariableRererence
				                      for: aMpped.
			           element variable: e.
			           element ]
		           ifNone: [ 
		           mapper hackieMissingVariableReference: name for: aMpped ].

	^ element
]

{ #category : #visiting }
MOAlceModelReader >> initialize [
	super initialize.
	stack := Stack new.
	contextStack := Stack new.
	createdElements := Dictionary new.
]

{ #category : #visiting }
MOAlceModelReader >> instantiate: aClass for: anAlcixFunction [

	| element |
	element := model instantiate: aClass.
	createdElements at: anAlcixFunction put: element.
	^ element
]

{ #category : #'as yet unclassified' }
MOAlceModelReader >> invocationFor: anAlcixInvocation arguments: arguments astNode: aVBImplicitParenthesesLessCallNode [

	| element candidate |
	self assert: anAlcixInvocation candidates size = 1.
	candidate := anAlcixInvocation candidates first.
	element := createdElements
		           at: candidate
		           ifPresent: [ :e | 
			           element := self
				                      instantiate: MOInvocation
				                      for: anAlcixInvocation.
			           element invocable: e.
			           element ]
		           ifAbsent: [ 
			           mapper
				           getInvocationFor: candidate
				           arguments: arguments
				           from: anAlcixInvocation ].
	^ element
]

{ #category : #'as yet unclassified' }
MOAlceModelReader >> invocationForOperator: aString [

	^ mapper getInvocationForOperator: aString
]

{ #category : #accessing }
MOAlceModelReader >> model [
	^ model
]

{ #category : #visiting }
MOAlceModelReader >> push: aValue during: aBlock [

	stack push: aValue.
	^ aBlock ensure: [ stack pop ]
]

{ #category : #visiting }
MOAlceModelReader >> pushContext: aValue during: aBlock [
	contextStack push: aValue.
	^ aBlock
		ensure: [ contextStack pop ]
]

{ #category : #'meta-object-protocol' }
MOAlceModelReader >> read: anAlcixFunction [
	read := anAlcixFunction accept: self.
	^ read
]

{ #category : #'as yet unclassified' }
MOAlceModelReader >> specialReturnVariableReference: anAlcixLocalVariable for: aVBSimpleIdentifierNode [

	| candidate element |
	candidate := anAlcixLocalVariable.
	element := createdElements
		           at: candidate
		           ifPresent: [ :e | 
			           element := self
				                      instantiate: MOVariableRererence
				                      for: anAlcixLocalVariable.
			           element variable: e.
			           element ]
		           ifAbsent: [ 
		           mapper
			           getVariableReference: candidate
			           from: anAlcixLocalVariable ].
	^ element
]

{ #category : #'as yet unclassified' }
MOAlceModelReader >> typeReferenceFrom: anAlcixParameter astNode: aVBParameterNode [

	anAlcixParameter type ifNil: [ self halt ].
	
	^ mapper getReference: anAlcixParameter type from: anAlcixParameter
]

{ #category : #'as yet unclassified' }
MOAlceModelReader >> variableReference: anAlcixAccess for: aVBSimpleIdentifierNode [

	| element candidate |
	self assert: anAlcixAccess candidates size = 1.
	candidate := anAlcixAccess candidates first.
	element := createdElements
		           at: candidate
		           ifPresent: [ :e | 
			           element := self
				                      instantiate: MOVariableRererence
				                      for: anAlcixAccess.
			           element variable: e.
			           element ]
		           ifAbsent: [ 
		           mapper
			           getVariableReference: candidate
			           from: anAlcixAccess ].
	^ element
]

{ #category : #visiting }
MOAlceModelReader >> visitArgument: aVBArgumentNode [

	| name argumentContext |
	" Nil means i lost the arguments in the model (WTF) "
	argumentContext := self withCurrentContext: [ :ctx | ctx ].
	argumentContext ifNil: [ 
		name := aVBArgumentNode value acceptVisitor: self.
		self assert: name isString.

		^ self hackieVariableReference: name for: aVBArgumentNode ].
	self assert: argumentContext outgoingAccesses size = 1.
	self assert:
		(argumentContext outgoingAccesses first isKindOf: AlcixAccess).

	^ self
		  variableReference: argumentContext outgoingAccesses first
		  for: aVBArgumentNode
]

{ #category : #visiting }
MOAlceModelReader >> visitArgumentList: aVBArgumentListNode [

	| args |
	" Nil means i lost the arguments in the model (WTF) "
	args := self withCurrentContext: [ :ctx | ctx ].

	^ args
		  ifNil: [ self visitCollection: aVBArgumentListNode arguments ]
		  ifNotNil: [ 
			  self
				  visitCollection: aVBArgumentListNode arguments
				  contextualingWith: args ]
]

{ #category : #visiting }
MOAlceModelReader >> visitBlock: aVBBlockNode [

	| block |
	block := self instantiate: MOBlock for: aVBBlockNode.
	self withTop: [ :t | t block: block ].
	self push: block during: [ self visitProgram: aVBBlockNode ].
	^ block
]

{ #category : #visiting }
MOAlceModelReader >> visitBooleanLiteral: aVBBooleanLiteralNode [

	^ (self instantiate: MOBooleanLiteral for: aVBBooleanLiteralNode)
		  literal: aVBBooleanLiteralNode token source;
		  yourself
]

{ #category : #visiting }
MOAlceModelReader >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOAlceModelReader >> visitCollection: entries contextualingWith: contexts [

	^ entries
		  with: contexts
		  collect: [ :e :c | 
		  self pushContext: c during: [ e acceptVisitor: self ] ]
]

{ #category : #visiting }
MOAlceModelReader >> visitComparisonOperation: aVBComparisonOperationNode [

	| left right operator comparisionOperator |
	left := aVBComparisonOperationNode left acceptVisitor: self.
	right := aVBComparisonOperationNode right acceptVisitor: self.
	comparisionOperator := OrderedCollection new.
	aVBComparisonOperationNode tokenVariables do: [ :r | 
		(aVBComparisonOperationNode perform: r) ifNotNil: [ :token | 
			comparisionOperator add: token value asSymbol ] ].
	self assert: comparisionOperator size = 1.
	operator := self invocationForOperator: comparisionOperator first.
	operator
		argumentOrSelf: left;
		furtherArguments: { right }.
	^ operator
]

{ #category : #visiting }
MOAlceModelReader >> visitConcatenationOperation: aVBConcatenationOperationNode [

	| left right operator |
	left := aVBConcatenationOperationNode left acceptVisitor: self.
	right := aVBConcatenationOperationNode right acceptVisitor: self.

	operator := self invocationForOperator: #&.
	operator
		argumentOrSelf: left;
		furtherArguments: { right }.
	^ operator
]

{ #category : #visiting }
MOAlceModelReader >> visitDimVariable: aVBDimVariableNode [

	| localVariable var |
	self withCurrentContext: [ :fn | 
		localVariable := fn localVariables detect: [ :lv | 
			                 lv name = aVBDimVariableNode variable name source ] ].
	self assert: localVariable isNotNil.
	var := self instantiate: MOVariable for: localVariable.


	var name: localVariable name.
	var type:
		(self typeReferenceFrom: localVariable astNode: aVBDimVariableNode).
	self withTop: [ :function | function addVariable: var ].
	^ var
]

{ #category : #visiting }
MOAlceModelReader >> visitExplicitAssignement: aVBExplicitAssignementNode [

	| assignment assignmentContext writeSymbol |
	assignmentContext := self withCurrentContext: [ :c | 
		                     c assignments , c returns select: [ :n | 
			                     n anchor srcFrom
			                     >= aVBExplicitAssignementNode startPosition 
				                     and: [ 
				                     n anchor srcTo
				                     <= aVBExplicitAssignementNode stopPosition ] ] ].
	self assert: assignmentContext size = 1.
	assignmentContext := assignmentContext first.
	assignment := self instantiate: MOAssignment for: assignmentContext.

	(assignmentContext isKindOf: AlcixReturn)
		ifFalse: [ 
			self assert: assignmentContext writeElement size = 1.
			assignment write: (self
					 variableReference: assignmentContext writeElement first
					 for: aVBExplicitAssignementNode left) ]
		ifTrue: [ 
			assignment write: (self
					 specialReturnVariableReference:
					 assignmentContext writeElement first
					 for: aVBExplicitAssignementNode left) ].

	self pushContext: assignmentContext during: [ 
		assignment read:
			(aVBExplicitAssignementNode right acceptVisitor: self) ].

	self withTop: [ :blc | blc addStatement: assignment ].
	^ assignment
]

{ #category : #visiting }
MOAlceModelReader >> visitFunction: anAlcixFunction [

	| return |
	self
		pushContext: anAlcixFunction
		during: [ return := anAlcixFunction ast acceptVisitor: self ].
	^ return
]

{ #category : #visiting }
MOAlceModelReader >> visitFunctionDefinition: aVBFunctionDefinitionNode [

	| function |
	function := self withCurrentContext: [ :fn | 
		            function := self instantiate: MOFunction for: fn.
		            function selector: fn selector.
		            function ].

	self
		withTop: [ :top | top addFunction: function ]
		ifEmpty: [ " i may be only reading the function " ].

	self
		push: function
		during: [ self visitProgram: aVBFunctionDefinitionNode ].
	^ function
]

{ #category : #visiting }
MOAlceModelReader >> visitIfThenElse: aVBIfThenElseNode [

	| if |
	self assert: aVBIfThenElseNode ifTrue isNotNil.
	self assert: aVBIfThenElseNode ifFalse isNil.
	self assert: aVBIfThenElseNode elseifs isEmpty.
	if := self instantiate: MOIfElse for: aVBIfThenElseNode.
	self push: if during: [ 
		if condition: (aVBIfThenElseNode condition acceptVisitor: self).
		if ifTrue: (aVBIfThenElseNode ifTrue acceptVisitor: self)].
	self withTop: [ :t | t addStatement: if ].
	^ if
]

{ #category : #visiting }
MOAlceModelReader >> visitImplicitParenthesesLessCall: aVBImplicitParenthesesLessCallNode [

	| members |
	members := self withCurrentContext: [ :ctx | 
		           ctx outgoingAccesses select: [ :n | 
			           n anchor isNotNil and: [ 
				           n anchor srcFrom
				           >= aVBImplicitParenthesesLessCallNode startPosition 
					           and: [ 
					           n anchor srcTo
					           <= aVBImplicitParenthesesLessCallNode stopPosition ] ] ] ].
	members size = 0 ifTrue: [ " it was probably not resolved "
		^ self getInvocationForNonResolvedCall:
			  aVBImplicitParenthesesLessCallNode ].


	self assert: members size = 1.

	members := self
		           pushContext: aVBImplicitParenthesesLessCallNode
		           during: [ members first accept: self ].
	^ members
]

{ #category : #visiting }
MOAlceModelReader >> visitInvocation: anAlcixInvocation [

	| args |
	args := anAlcixInvocation arguments
		        ifEmpty: [ #(  ) ]
		        ifNotEmpty: [ 
			        self withCurrentContext: [ :a | 
				        self
					        pushContext: anAlcixInvocation arguments
					        during: [ a arguments acceptVisitor: self ] ] ].


	^ self withCurrentContext: [ :ctx | 
		  self invocationFor: anAlcixInvocation arguments: args astNode: ctx ]
]

{ #category : #visiting }
MOAlceModelReader >> visitMemberAccess: aVBMemberAccessNode [

	| members |
	members := self withCurrentContext: [ :ctx | 
		           ctx readElements select: [ :n | 
			           n anchor isNotNil and: [ 
				           n anchor srcFrom >= aVBMemberAccessNode startPosition 
					           and: [ 
					           n anchor srcTo <= aVBMemberAccessNode stopPosition ] ] ] ].
	self assert: members size = 1.
	members := self
		           pushContext: aVBMemberAccessNode
		           during: [ members first accept: self ].
	^ members
]

{ #category : #visiting }
MOAlceModelReader >> visitParameter: aVBParameterNode [

	| var parameter |
	parameter := self withCurrentContext: [ :f | 
		             f parameters detect: [ :p | 
			             p name = aVBParameterNode name source ] ].
	var := self instantiate: MOVariable for: parameter.
	var name: parameter name.
	var type:
		(self typeReferenceFrom: parameter astNode: aVBParameterNode).
	self withTop: [ :function | function addParameter: var ].
	^ var
]

{ #category : #visiting }
MOAlceModelReader >> visitParameterList: aVBParameterListNode [

	^ self visitCollection: aVBParameterListNode parameters
]

{ #category : #visiting }
MOAlceModelReader >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [

	| members |
	members := self withCurrentContext: [ :ctx | 
		           ctx outgoingAccesses select: [ :n | 
			           n anchor isNotNil and: [ 
				           n anchor srcFrom
				           >= aVBProcedureCallOrArrayAccessNode startPosition 
					           and: [ 
					           n anchor srcTo
					           <= aVBProcedureCallOrArrayAccessNode stopPosition ] ] ] ].
	members size = 0 ifTrue: [ " it was probably not resolved "
		^ self getInvocationForNonResolvedCall:
			  aVBProcedureCallOrArrayAccessNode ].


	self assert: members size = 1.

	members := self
		           pushContext: aVBProcedureCallOrArrayAccessNode
		           during: [ members first accept: self ].
	^ members
]

{ #category : #visiting }
MOAlceModelReader >> visitProgram: aVBFunctionDefinitionNode [

	^ self visitCollection: aVBFunctionDefinitionNode sortedChildren
]

{ #category : #visiting }
MOAlceModelReader >> visitSimpleIdentifier: aVBSimpleIdentifierNode [ 
	^ aVBSimpleIdentifierNode token source 
]

{ #category : #visiting }
MOAlceModelReader >> visitStringLiteral: aVBStringLiteralNode [

	^ (self instantiate: MOStringLiteral for: aVBStringLiteralNode) 
		  literal: (aVBStringLiteralNode token value
				   copyFrom: 2
				   to: aVBStringLiteralNode token value size - 1)
]

{ #category : #visiting }
MOAlceModelReader >> visitTypedThing: aVBTypedThingNode [

	| ret |
	self withTop: [ :fn | 
		self withCurrentContext: [ :alFn | 
			fn type: (self typeReferenceFrom: alFn astNode: aVBTypedThingNode) ].
		ret := fn type ].
	^ ret
]

{ #category : #visiting }
MOAlceModelReader >> withCurrentContext: aBlock [

	^ self withCurrentContext: aBlock ifEmpty: [ self error: 'Stack is empty!' ]
]

{ #category : #visiting }
MOAlceModelReader >> withCurrentContext: aBlock ifEmpty: aanEmptyBlock [

	^ contextStack
		  ifEmpty: aanEmptyBlock
		  ifNotEmpty: [ aBlock value: contextStack top ]
]

{ #category : #visiting }
MOAlceModelReader >> withTop: aBlock [

	^ self withTop: aBlock ifEmpty: [ self error: 'Stack is empty!' ]
]

{ #category : #visiting }
MOAlceModelReader >> withTop: aBlock ifEmpty: aanEmptyBlock [

	stack ifEmpty: aanEmptyBlock ifNotEmpty: [ aBlock value: stack top ]
]
