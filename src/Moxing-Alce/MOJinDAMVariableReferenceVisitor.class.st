Class {
	#name : #MOJinDAMVariableReferenceVisitor,
	#superclass : #MOVariableReferenceVisitor,
	#instVars : [
		'arguments',
		'producedSegments',
		'reader'
	],
	#category : #'Moxing-Alce'
}

{ #category : #accessing }
MOJinDAMVariableReferenceVisitor >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
MOJinDAMVariableReferenceVisitor >> infereTarget: aJinDAMMemberReference [

	aJinDAMMemberReference kindAccess = #dictionary
		ifTrue: [ 
			^ writer
				  arrayAccess: [ :exp | 
					  producedSegments
						  ifNotEmpty: [ producedSegments removeLast ]
						  ifEmpty: [ exp referenceToSelf ] ]
				  arguments: [ :expr | 
				  { (expr stringLiteral: aJinDAMMemberReference name) } ] ]
		ifFalse: [ 
			aJinDAMMemberReference arguments
				ifEmpty: [ 
					^ producedSegments
						  ifEmpty: [ 
						  writer variableReferenceNamed: aJinDAMMemberReference name ]
						  ifNotEmpty: [ 
							  writer
								  accessAttribute: aJinDAMMemberReference name
								  receiver: [ :exp | producedSegments removeLast ] ] ]
				ifNotEmpty: [ 
					self assert:
						aJinDAMMemberReference context readReference
						= aJinDAMMemberReference.
					({ #Join. #Replace } includes: aJinDAMMemberReference name) 
						ifFalse: [ self halt ].
					aJinDAMMemberReference candidate ifNotNil: [  : candi | self halt  ].
					^ writer
						  invocation: aJinDAMMemberReference name
						  arguments: [ arguments ] ] ]
]

{ #category : #accessing }
MOJinDAMVariableReferenceVisitor >> reader: aMOJinDAMImporter [ 
	reader := aMOJinDAMImporter
]

{ #category : #'as yet unclassified' }
MOJinDAMVariableReferenceVisitor >> trace: aJindamObject with: aMOObject [

	reader trace: aJindamObject with: aMOObject
]

{ #category : #'as yet unclassified' }
MOJinDAMVariableReferenceVisitor >> variableReferenceFor: aJinDAMMemberReference [

	| segments read |
	segments := OrderedCollection new.
	read := aJinDAMMemberReference.
	[ read isKindOf: JinDAMReference ] whileTrue: [ 
		segments add: read.
		read := read context ].
	segments := segments reverse.
	producedSegments := OrderedCollection new.

	segments do: [ :s | 
		self trace: s with: (writer writeExpression: [ :exp | 
				 producedSegments add:
					 (self use: exp during: [ s acceptVisitor: self ]) ]).
		self assert: writer isuable ].
	self assert: producedSegments size = 1.

	arguments ifNotEmpty: [ 
		(producedSegments first isKindOf: MOAttributeAccess)
			ifTrue: [ 
				| ps |
				ps := producedSegments removeLast.
				producedSegments add:
					(writer arrayAccess: [ :e | ps ] arguments: [ :e | arguments ]) ]
			ifFalse: [ 
				(producedSegments first isKindOf: MOVariableReference)
					ifTrue: [ "						self halt."
						self assert: arguments size = 1.
						producedSegments removeLast.
						producedSegments add: arguments first ]
					ifFalse: [ 
					self assert: arguments = producedSegments first arguments ] ] ].
	^ writer writenExpression: producedSegments first
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitAttribute: aJinDAMAttribute [

	self assert: producedSegments size <= 1.


	^ producedSegments
		  ifEmpty: [ writer variableReferenceNamed: aJinDAMAttribute name ]
		  ifNotEmpty: [ 
			  | receiver |
			  receiver := producedSegments removeLast.
			  writer
				  accessAttribute: aJinDAMAttribute name
				  receiver: [ :e | receiver ] ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitAttributeAccessor: aJinDAMAttributeAccessor [

	| parent |
	self assert: producedSegments size <= 1.

	^ producedSegments
		  ifEmpty: [ 
			  parent := reader parentOfInvocable: aJinDAMAttributeAccessor.
			  (parent isKindOf: JinDAMClass)
				  ifTrue: [ 
					  writer
						  invokeMethodNamed: aJinDAMAttributeAccessor selector
						  receiver: [ :e | e referenceToSelf ]
						  arguments: [ :e | arguments ] ]
				  ifFalse: [ 
					  writer
						  invocation: aJinDAMAttributeAccessor selector
						  arguments: [ :exp | arguments ] ] ]
		  ifNotEmpty: [ 
			  | receiver |
			  receiver := producedSegments removeLast.
			  writer
				  invokeMethodNamed: aJinDAMAttributeAccessor selector
				  receiver: [ :e | receiver ]
				  arguments: [ :e | arguments ] ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitConstant: aJinDAMConstant [

	^ writer constantReferenceNamed: aJinDAMConstant name
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitEnumValue: aJinDAMEnumValue [

	self assert: producedSegments isEmpty.
	^ writer constantReferenceNamed: aJinDAMEnumValue name
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitForm: aJinDAMForm [ 
	^ writer variableReferenceNamed: aJinDAMForm name
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitFunction: aJinDAMFunction [

	^ self visitSubProcedure: aJinDAMFunction
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitLocalVariable: aJinDAMLocalVariable [

	self assert: producedSegments isEmpty.
	^ writer variableReferenceNamed: aJinDAMLocalVariable name
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitMemberReference: aJinDAMMemberReference [

	^ aJinDAMMemberReference candidate isCollection
		  ifFalse: [ 
			  aJinDAMMemberReference candidate
				  ifNil: [ self infereTarget: aJinDAMMemberReference ]
				  ifNotNil: [ :c | c acceptVisitor: self ] ]
		  ifTrue: [ 
			  (aJinDAMMemberReference candidate detect: [ :a | 
				   a isKindOf: JinDAMAttribute ]) acceptVisitor: self ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitParameter: aJinDAMParameter [

	self assert: producedSegments isEmpty.
	^ writer variableReferenceNamed: aJinDAMParameter name
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitSubProcedure: aJinDAMSubProcedure [

	| parent |
	self assert: producedSegments size <= 1.
	parent := reader parentOfInvocable: aJinDAMSubProcedure.
	^ (parent isKindOf: JinDAMClass)
		  ifTrue: [ 
			  writer
				  invokeMethodNamed: aJinDAMSubProcedure selector
				  receiver: [ :e | 
					  producedSegments
						  ifEmpty: [ e referenceToSelf ]
						  ifNotEmpty: [ producedSegments removeLast ] ]
				  arguments: [ :e | arguments ] ]
		  ifFalse: [ 
			  producedSegments ifNotEmpty: [ producedSegments removeLast ].
			  writer
				  invocation: aJinDAMSubProcedure selector
				  arguments: [ :exp | arguments ] ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitTypeReference: aJinDAMTypeReference [

	self assert: producedSegments isEmpty.
	^ reader typeReferenceFor: aJinDAMTypeReference using: writer
]
