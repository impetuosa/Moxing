Trait {
	#name : #MORBImportingTrait,
	#category : #'Moxing-StVisualWorks'
}

{ #category : #evaluating }
MORBImportingTrait >> addBindings: aCollection during: aBlock [
  | prev col |
  prev := self bindings.
  col := aCollection asDictionary.
  self bindings keysAndValuesDo: [:k :v |  col at: k ifAbsentPut: [ self bindings at: k ] ].
  self bindings: col.
  ^aBlock ensure: [ self bindings: prev ]
]

{ #category : #'as yet unclassified' }
MORBImportingTrait >> methodBindings: aRBMethodNode [

	^ aRBMethodNode arguments collect: [ :arg | arg name -> #Parameter ]
]

{ #category : #'as yet unclassified' }
MORBImportingTrait >> sequenceBindings: aRBSequenceNode [

	^ aRBSequenceNode temporaryVariables collect: [ :a | 
		  a name -> #LocalVariable ]
]

{ #category : #'as yet unclassified' }
MORBImportingTrait >> use: aWriter during: aBlock [

	| prev |
	prev := self writer.
	self writer: aWriter.
	^ aBlock ensure: [ self writer: prev ]
]

{ #category : #visiting }
MORBImportingTrait >> visitAssignmentNode: aRBAssignmentNode [

	^ self writer
		  let: [ :exp | 
		  exp variableReferenceNamed: aRBAssignmentNode variable name ]
		  beAssignedWith: [ :exp | 
			  self
				  use: exp
				  during: [ aRBAssignmentNode value acceptVisitor: self ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitBlockNode: aRBBlockNode [

  ^self writer writeBlockClosure: [:closure |  
		aRBBlockNode arguments do: [:a |  
			closure writeParameter: [:parameter |  parameter name: a name ] 
		].
      self use: closure during: [ aRBBlockNode body acceptVisitor: self ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitCascadeNode: aRBCascadeNode [

	^ self writer stCascadeWith: [ :exp | 
		  aRBCascadeNode messages collect: [ :m | 
			  self use: exp during: [ m acceptVisitor: self ] ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitCollection: aCollection [

	^ aCollection collect: [ :element | element acceptVisitor: self ]
]

{ #category : #visiting }
MORBImportingTrait >> visitLiteralArrayNode: aRBLiteralArrayNode [

	^ self visitLiteralValueNode: aRBLiteralArrayNode
]

{ #category : #visiting }
MORBImportingTrait >> visitLiteralValueNode: aRBLiteralValueNode [

	^ self writer writeLiteralForValue: aRBLiteralValueNode value
]

{ #category : #visiting }
MORBImportingTrait >> visitMessageNode: aRBMessageNode [
	 
((	aRBMessageNode receiver isKindOf: RBVariableNode )and: [	aRBMessageNode receiver name  = #return]) ifTrue: [ self halt ].
	^ self writer
		  invokeMethodNamed: aRBMessageNode selector
		  receiver: [ :exp | 
			  self
				  use: exp
				  during: [ aRBMessageNode receiver acceptVisitor: self ] ]
		  arguments: [ :exp | 
			  self
				  use: exp
				  during: [ self visitCollection: aRBMessageNode arguments ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitMethodNode: aRBMethodNode [

	^ self addBindings: (self methodBindings: aRBMethodNode) during: [ 
		  self writer writeStMethod: [ :method | 
			  method category: self methodCategory.
			  method selector: aRBMethodNode selector.
			  aRBMethodNode arguments do: [ :a | 
				  method writeParameter: [ :parameter | parameter name: a name ] ].
			  self
				  use: method
				  during: [ aRBMethodNode body acceptVisitor: self ] ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitPragmaNode: aPragmaNode [

	^ self writer pragma: aPragmaNode selector arguments: [ :exp | 
		  self
			  use: exp
			  during: [ self visitCollection: aPragmaNode arguments ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitReturnNode: aRBReturnNode [

	^ self writer writeReturn: [ :return | 
		  return writeExpression: [ :exp | 
			  self use: exp during: [ aRBReturnNode value acceptVisitor: self ] ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitSelfNode: aRBVariableNode [

	^ self writer writeReferenceToSelf
]

{ #category : #visiting }
MORBImportingTrait >> visitSequenceNode: aRBSequenceNode [
	^ self
		  addBindings: (self sequenceBindings: aRBSequenceNode)
		  during: [ 
			  self writer writeBlock: [ :block | 
				  self use: block during: [ 
					  aRBSequenceNode parent isMethod ifTrue: [ 
						  aRBSequenceNode parent pragmas do: [ :t | 
							  block writeStatement: [ :stmt | 
								  self use: stmt during: [ t acceptVisitor: self ] ] ] ].
					  aRBSequenceNode temporaries do: [ :temp | 
						  self writer writeVariable: [ :var | var name: temp name ] ] ].
				  aRBSequenceNode statements do: [ :t | 
					  block writeStatement: [ :stmt | 
						  self use: stmt during: [ t acceptVisitor: self ] ] ] ] ]
]

{ #category : #visiting }
MORBImportingTrait >> visitSuperNode: aRBVariableNode [

	^ self writer writeReferenceToSuper
]

{ #category : #'as yet unclassified' }
MORBImportingTrait >> visitThisContextNode: aRBVariableNode [

	^ self writer writeReferenceToThisContext
]

{ #category : #visiting }
MORBImportingTrait >> visitVariableNode: aRBVariableNode [
  | symbol |
  symbol := self bindings at: aRBVariableNode name ifAbsent: [
	 aRBVariableNode name first isUppercase 
			ifTrue: [ #Class ] 
			ifFalse: [ #InstanceVariable ] 
	].
(  #(Parameter LocalVariable InstanceVariable Package) includes: symbol ) ifTrue: [ ^self writer writeVariableAccessNamed: aRBVariableNode name ].
  symbol = #Class ifTrue: [ 
	self assert: (aRBVariableNode name indexOf: $.) = 0.  
	^self writer writeTypeReferenceNamed:  aRBVariableNode name].
self error: 'Unexpected symbol'
]
