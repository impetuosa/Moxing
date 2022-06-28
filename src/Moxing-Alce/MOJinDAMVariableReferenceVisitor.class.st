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

	aJinDAMMemberReference candidate ifNotNil: [ :candi | self halt ].

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
					(({ #Join. #Replace. #fgRubIdentite. #fgRubNom. #fgestnullouvide } 
						  includes: aJinDAMMemberReference name) or: [ 
						 aJinDAMMemberReference name beginsWith: 'fg' ]) ifFalse: [  ].

					^ producedSegments
						  ifEmpty: [ 
							  writer
								  invocation: aJinDAMMemberReference name
								  arguments: [ arguments ] ]
						  ifNotEmpty: [ 
							  writer
								  invokeMethodNamed: aJinDAMMemberReference name
								  receiver: [ :exp | producedSegments removeLast ]
								  arguments: [ arguments ] ] ] ]
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
				({ 
					 MOConstantReference.
					 MOVariableReference } anySatisfy: [ :a | 
					 producedSegments first isKindOf: a ])
					ifTrue: [ 
						| ps |
						ps := producedSegments removeLast.
						producedSegments add:
							(writer arrayAccess: [ :e | ps ] arguments: [ :e | arguments ]) ]
					ifFalse: [ 
					"self assert: arguments = producedSegments first arguments" ] ] ].
	^ writer writenExpression: producedSegments first

	"						arguments size = 1
							ifTrue: [ 
								self halt.
								producedSegments removeLast.
								producedSegments add: arguments first ]
							ifFalse: [ 
								| ps |
								ps := producedSegments removeLast.
								producedSegments add:
									(writer
										 arrayAccess: [ :e | ps ]
										 arguments: [ :e | arguments ]) ]"
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

	self assert: producedSegments size <= 1.


	^ producedSegments
		  ifEmpty: [ writer constantReferenceNamed: aJinDAMConstant name ]
		  ifNotEmpty: [ 
			  | receiver |
			  receiver := producedSegments removeLast.
			  writer
				  accessAttribute: aJinDAMConstant name
				  receiver: [ :e | receiver ] ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitEnumValue: aJinDAMEnumValue [

	self assert: producedSegments size <= 1.


	^ producedSegments
		  ifEmpty: [ writer constantReferenceNamed: aJinDAMEnumValue name ]
		  ifNotEmpty: [ 
			  | receiver |
			  receiver := producedSegments removeLast.
			  writer
				  accessAttribute: aJinDAMEnumValue name
				  receiver: [ :e | receiver ] ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitEvent: aJinDAMEvent [ 

	| parent |
	self assert: producedSegments size <= 1.
	parent := reader parentOfInvocable: aJinDAMEvent.
	^ (parent isKindOf: JinDAMClass)
		  ifTrue: [ 
			  writer
				  invokeMethodNamed: aJinDAMEvent selector
				  receiver: [ :e | 
					  producedSegments
						  ifEmpty: [ e referenceToSelf ]
						  ifNotEmpty: [ producedSegments removeLast ] ]
				  arguments: [ :e | arguments ] ]
		  ifFalse: [ 
			  producedSegments ifNotEmpty: [ producedSegments removeLast ].
			  writer
				  invocation: aJinDAMEvent selector
				  arguments: [ :exp | arguments ] ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitExternalFunction: aJinDAMExternalFunction [

	^ self visitFunction: aJinDAMExternalFunction
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitExternalSubProcedure: aJinDAMExternalSubProcedure [

	^ self visitSubProcedure:  aJinDAMExternalSubProcedure
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
MOJinDAMVariableReferenceVisitor >> visitLibraryReference: aJinDAMLibraryReference [ 
	self assert: producedSegments isEmpty.
	^ reader libraryReferenceFor: aJinDAMLibraryReference using: writer
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitLocalVariable: aJinDAMLocalVariable [

	self assert: producedSegments size <= 1.


	^ producedSegments
		  ifEmpty: [ 
		  writer variableReferenceNamed: aJinDAMLocalVariable name ]
		  ifNotEmpty: [ 
			  | receiver |
			  receiver := producedSegments removeLast.
			  writer
				  accessAttribute: aJinDAMLocalVariable name
				  receiver: [ :e | receiver ] ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitMemberReference: aJinDAMMemberReference [

	^ aJinDAMMemberReference candidate isCollection
		  ifFalse: [ 
			  aJinDAMMemberReference candidate
				  ifNil: [ self infereTarget: aJinDAMMemberReference ]
				  ifNotNil: [ :c | 
					  aJinDAMMemberReference name = #Me
						  ifTrue: [ writer referenceToSelf ]
						  ifFalse: [ c acceptVisitor: self ] ] ]
		  ifTrue: [ 
			  (aJinDAMMemberReference candidate
				   detect: [ :a | a isKindOf: JinDAMAttribute ]
				   ifNone: [ aJinDAMMemberReference candidate anyOne ]) 
				  acceptVisitor: self ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitParameter: aJinDAMParameter [

	producedSegments ifNotEmpty: [ 
		"Warning signal:
			'this does not make sense. Something before a parameter. like function.parameter? is that possible to write? '."
		producedSegments removeLast ].
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
MOJinDAMVariableReferenceVisitor >> visitTypeMemberReference: aJinDAMTypeMemberReference [

	" This is an array / dictionary access,
	Me!Name or Me('Name') "

	self assert: aJinDAMTypeMemberReference name isNil.
	self assert: aJinDAMTypeMemberReference arguments size = 1.
	self assert:
		arguments size = aJinDAMTypeMemberReference arguments size.

	^ writer
		  arrayAccess: [ :expr | producedSegments removeFirst ]
		  arguments: [ :expr | arguments ]
]

{ #category : #visiting }
MOJinDAMVariableReferenceVisitor >> visitTypeReference: aJinDAMTypeReference [

	self assert: aJinDAMTypeReference dimensions = 0.

	^ producedSegments
		  ifEmpty: [ 
		  reader typeReferenceFor: aJinDAMTypeReference using: writer ]
		  ifNotEmpty: [ 
			  | receiver |
			  self assert: producedSegments size = 1.
			  receiver := producedSegments removeLast.
			  writer
				  accessType: aJinDAMTypeReference name
				  receiver: [ :r | receiver ] ]
]
