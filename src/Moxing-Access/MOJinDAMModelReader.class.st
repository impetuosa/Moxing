Class {
	#name : #MOJinDAMModelReader,
	#superclass : #MOModelReader,
	#instVars : [
		'traces',
		'jindamModel'
	],
	#category : #'Moxing-Access'
}

{ #category : #'as yet unclassified' }
MOJinDAMModelReader >> libraryReferenceFor: aJinDAMLibraryReference using: aWriter [

	^ aJinDAMLibraryReference
		  ifNil: [ aWriter primitiveTypeReferenceNamed: #Variant ]
		  ifNotNil: [ 
			  self
				  trace: aJinDAMLibraryReference
				  with: (MOJinDAMTypeReferenceVisitor new
						   writer: aWriter;
						   typeReferenceFor: aJinDAMLibraryReference) ]
]

{ #category : #'as yet unclassified' }
MOJinDAMModelReader >> makeAssignmentWith: aJinDAMArgument [

	(aJinDAMArgument expression isKindOf: JinDAMAccessWrite) ifTrue: [ 
		^ aJinDAMArgument expression acceptVisitor: self ].
	^ aJinDAMArgument expression operator = #=
		  ifTrue: [ 
			  writer
				  let: [ :expr | 
					  self
						  use: expr
						  during: [ aJinDAMArgument expression left acceptVisitor: self ] ]
				  beAssignedWith: [ :expr | 
					  self
						  use: expr
						  during: [ 
						  aJinDAMArgument expression right acceptVisitor: self ] ] ]
		  ifFalse: [ 
			  writer noOp:
				  'Error interpreting an assignment. It was interpreted as a property named Set / Let... Cannot accept it in Moxing. Is incorrect. ' ]
]

{ #category : #'as yet unclassified' }
MOJinDAMModelReader >> parentOfInvocable: aJinDAMSubProcedure [

	^ jindamModel entities detect: [ :a | 
		  (a isKindOf: JinDAMModule) and: [ 
			  a invocables includes: aJinDAMSubProcedure ] ]
]

{ #category : #visiting }
MOJinDAMModelReader >> read: anEntity [ 

	read := anEntity acceptVisitor: self .
	^ read 
]

{ #category : #'as yet unclassified' }
MOJinDAMModelReader >> trace: aJinDAMTypeReference with: aMOTypeReference [

	(self traces
		 at: aJinDAMTypeReference
		 ifAbsentPut: [ OrderedCollection new ]) add: aMOTypeReference.
	^ aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOJinDAMModelReader >> traces [
	^ traces ifNil: [ traces := Dictionary new  ]
]

{ #category : #'as yet unclassified' }
MOJinDAMModelReader >> typeReferenceFor: aJinDAMTypeReference using: aWriter [

	^ aJinDAMTypeReference
		  ifNil: [ aWriter primitiveTypeReferenceNamed: #Variant ]
		  ifNotNil: [ 
			  self
				  trace: aJinDAMTypeReference
				  with: (MOJinDAMTypeReferenceVisitor new
						   writer: aWriter;
						   typeReferenceFor: aJinDAMTypeReference) ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAccessModule: aJinDAMAccessModule [

	| module |
	module := self
		          trace: aJinDAMAccessModule
		          with: (writer writeProject: [ :p | 
				           p name: aJinDAMAccessModule name.
				           self use: p during: [ 
					           self visitCollection: aJinDAMAccessModule globals.
					           self visitCollection: aJinDAMAccessModule types ] ]).
	module name: aJinDAMAccessModule name.
	MOJinDAMQueryLinkSolver new
		relations: jindamModel tableRelations;
		writer: writer;
		applyOn: module.
	^ module
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAccessRead: aJinDAMAccessRead [

	^ self
		  trace: aJinDAMAccessRead
		  with: (aJinDAMAccessRead readReference acceptVisitor: self)
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAccessWrite: aJinDAMAccessWrite [

	^ self trace: aJinDAMAccessWrite with: (aJinDAMAccessWrite isReturn
			   ifTrue: [ 
				   writer setToReturn: [ :expr | 
					   self
						   use: expr
						   during: [ 
						   aJinDAMAccessWrite valueToAssign acceptVisitor: self ] ] ]
			   ifFalse: [ 
				   writer
					   let: [ :expr | 
						   self
							   use: expr
							   during: [ aJinDAMAccessWrite assignedTo acceptVisitor: self ] ]
					   beAssignedWith: [ :expr | 
						   self
							   use: expr
							   during: [ 
							   aJinDAMAccessWrite valueToAssign acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAlias: aJinDAMAlias [

	^ self trace: aJinDAMAlias with: (writer writeAlias: [ :alias | 
			   alias name: aJinDAMAlias name.
			   alias typeReference:
				   (self typeReferenceFor: aJinDAMAlias typeReference using: alias) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitArgument: aJinDAMArgument [

	^ self
		  trace: aJinDAMArgument
		  with: (writer writeExpression: [ :exp | 
				   self use: exp during: [ 
					   aJinDAMArgument expression
						   ifNil: [ 
							   exp noOp:
								   'Error during the loading of argument '
								   , aJinDAMArgument text ]
						   ifNotNil: [ aJinDAMArgument expression acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAttribute: aJinDAMAttribute [

	aJinDAMAttribute name asLowercase = #me ifTrue: [ ^ self ].

	^ self
		  trace: aJinDAMAttribute
		  with: (writer writeAttribute: [ :attr | 
				   attr writeInitializer: [ :expr | 
					   self use: expr during: [ 
						   aJinDAMAttribute initializer ifNotNil: [ :i | 
							   i acceptVisitor: self ] ] ].
				   attr name: aJinDAMAttribute name.
				   attr typeReference:
					   (self
						    typeReferenceFor: aJinDAMAttribute typeReference
						    using: attr) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAttribute: aJinDAMAttribute forQuery: aJinDAMQuery [.
	^ self
		  trace: aJinDAMAttribute
		  with: (writer writeQueryAttribute: [ :attr | 
				   attr writeInitializer: [ :expr | 
					   self use: expr during: [ 
						   aJinDAMAttribute initializer ifNotNil: [ :i | 
							   i acceptVisitor: self ] ] ].
				   attr name: aJinDAMAttribute name.
				   attr typeReference:
					   (self
						    typeReferenceFor: aJinDAMAttribute typeReference
						    using: attr) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAttributeAccessor: aJinDAMAttributeAccessor [
	^ self
		  trace: aJinDAMAttributeAccessor
		  with: (writer writeAttributeAccessor: [ :accessor | 
				   accessor selector: aJinDAMAttributeAccessor selector.
				   accessor kind: aJinDAMAttributeAccessor kind.
				   accessor returnTypeReference: (self
						    typeReferenceFor: aJinDAMAttributeAccessor typeReference
						    using: accessor).
				   self use: accessor during: [ 
					   aJinDAMAttributeAccessor parameters do: [ :p | 
						   p acceptVisitor: self ].
					   aJinDAMAttributeAccessor block ifNotNil: [ :b | 
						   b acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitAttributeForQuery: aJinDAMAttribute [

	aJinDAMAttribute name asLowercase = #me ifTrue: [ ^ self ].

	^ self
		  trace: aJinDAMAttribute
		  with: (writer writeAttribute: [ :attr | 
				   attr writeInitializer: [ :expr | 
					   self use: expr during: [ 
						   aJinDAMAttribute initializer ifNotNil: [ :i | 
							   i acceptVisitor: self ] ] ].
				   attr name: aJinDAMAttribute name.
				   attr typeReference:
					   (self
						    typeReferenceFor: aJinDAMAttribute typeReference
						    using: attr) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitBinaryOperation: aJinDAMBinaryOperation [

	^ self
		  trace: aJinDAMBinaryOperation
		  with: (writer writeExpression: [ :expr | 
				   self use: expr during: [ 
					   expr
						   operate: [ aJinDAMBinaryOperation left acceptVisitor: self ]
						   operator: aJinDAMBinaryOperation operator
						   with: [ aJinDAMBinaryOperation right acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitBlock: aJinDAMBlock [

	"
		JinDAM when importing bunch of variables or constants it puts them in a collection. 
		int a,b,c,d. 
	"
	^ self trace: aJinDAMBlock with: (writer writeBlock: [ :block | 
			   (aJinDAMBlock statements flatCollect: [ :a | 
				    a isCollection
					    ifTrue: [ a ]
					    ifFalse: [ { a } ] ]) collect: [ :s | 
				   block writeStatement: [ :stmt | 
					   self use: stmt during: [ s acceptVisitor: self ] ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitClass: aJinDAMClass [

	^ writer writeDeclarationUnit: [ :unit | 
		  self
			  use: unit
			  during: [ self visitCollection: aJinDAMClass types ].
		  self trace: aJinDAMClass with: (unit writeClass: [ :class | 
				   class name: aJinDAMClass name.
				   self use: class during: [ 
					   aJinDAMClass superClassReference ifNotNil: [ :sc | 
						   class superclassReference:
							   (self typeReferenceFor: sc using: class) ].

					   self visitCollection: aJinDAMClass attributes.
					   self visitCollection: aJinDAMClass invocables ] ]) ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitConstant: aJinDAMConstant [

	^ self
		  trace: aJinDAMConstant
		  with: (writer writeConstant: [ :constant | 
				   constant name: aJinDAMConstant name.
				   aJinDAMConstant initializer ifNotNil: [ 
					   constant writeInitializer: [ :expr | 
						   self use: expr during: [ 
							   aJinDAMConstant initializer isCollection
								   ifFalse: [ aJinDAMConstant initializer acceptVisitor: self ]
								   ifTrue: [ 
									  " self halt:
										   'This is aweful review JinDAM is important here. '."
									   nil ] ] ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitDoUntil: aJinDAMDoUntil [

	^ self trace: aJinDAMDoUntil with: (writer
			   do: [ :block | 
				   self
					   use: block
					   during: [ aJinDAMDoUntil block acceptVisitor: self ] ]
			   until: [ :exp | 
				   self
					   use: exp
					   during: [ aJinDAMDoUntil condition acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitDoWhile: aJinDAMDoWhile [

	^ self trace: aJinDAMDoWhile with: (writer
			   while: [ :exp | 
				   self
					   use: exp
					   during: [ aJinDAMDoWhile condition acceptVisitor: self ] ]
			   do: [ :block | 
				   self
					   use: block
					   during: [ aJinDAMDoWhile block acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitEnum: aJinDAMEnum [

	^ self trace: aJinDAMEnum with: (writer writeEnum: [ :enum | 
			   enum visibility: aJinDAMEnum visibility.
			   enum name: aJinDAMEnum name.
			   aJinDAMEnum values do: [ :e | 
				   self trace: e with: (enum writeEntry: [ :entry | 
						    | lit |
						    lit := e value isNumber
							           ifTrue: [ enum numericLiteral: e value ]
							           ifFalse: [ 
								           e value isString
									           ifTrue: [ enum stringLiteral: e value ]
									           ifFalse: [ self halt ] ].
						    entry
							    typeReference: (entry typeReferenceNamed: aJinDAMEnum name);
							    name: e name;
							    value: lit ]) ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitEvent: aJinDAMEvent [

	^ self trace: aJinDAMEvent with: (writer writeEvent: [ :event | 
			   event selector: aJinDAMEvent selector.
			   self
				   use: event
				   during: [ 
				   aJinDAMEvent parameters do: [ :p | p acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitExit: aJinDAMExit [

	^ self
		  trace: aJinDAMExit
		  with: (writer writeStatement: [ :stmt | stmt exit ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitExpressionReference: aJinDAMExpressionReference [

	| ref |
	self assert:
		(aJinDAMExpressionReference referee isKindOf: JinDAMAccessRead).
	self assert: aJinDAMExpressionReference arguments isNotEmpty.


	^ self trace: aJinDAMExpressionReference with: (writer
			   arrayAccess: [ :exp | 
				   self
					   use: exp
					   during: [ 
					   aJinDAMExpressionReference referee acceptVisitor: self ] ]
			   arguments: [ :expr | 
				   self
					   use: expr
					   during: [ 
					   aJinDAMExpressionReference arguments acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitExternalFunction: aJinDAMExternalFunction [

	| selector librarySelector |
	selector := aJinDAMExternalFunction realSelector ifNil: [ 
		            aJinDAMExternalFunction selector ].
	librarySelector := aJinDAMExternalFunction selector.

	^ self
		  trace: aJinDAMExternalFunction
		  with: (writer writeExternalFunction: [ :function | 
				   function selector: selector.
				   function libraryName: aJinDAMExternalFunction libraryName.
				   function librarySelector: librarySelector.
				   aJinDAMExternalFunction typeReference ifNotNil: [ 
					   function returnTypeReference: (self
							    typeReferenceFor: aJinDAMExternalFunction typeReference
							    using: function) ].
				   self use: function during: [ 
					   aJinDAMExternalFunction parameters do: [ :p | 
						   p acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitExternalSubProcedure: aJinDAMExternalSubProcedure [ 

	| selector librarySelector |
	selector := aJinDAMExternalSubProcedure realSelector ifNil: [ 
		            aJinDAMExternalSubProcedure selector ].
	librarySelector := aJinDAMExternalSubProcedure selector.


	^ self
		  trace: aJinDAMExternalSubProcedure
		  with: (writer writeExternalProcedure: [ : procedure | 
				   procedure selector: selector.
				   procedure libraryName: aJinDAMExternalSubProcedure libraryName.
				   procedure librarySelector: librarySelector.


				   self use: procedure during: [ 
					   aJinDAMExternalSubProcedure parameters do: [ :p | 
						   p acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitFileLineInput: aJinDAMFileLineInput [

	^ self
		  trace: aJinDAMFileLineInput
		  with: (writer writeFileLineInput: [ :fo | 
				   fo
					   inputReference: (fo writeUnregisteredExpression: [ :e | 
								    self
									    use: e
									    during: [ 
										    aJinDAMFileLineInput inputReference acceptVisitor: self ] ]);
					   fileDescriptorReference:
						   (fo writeUnregisteredExpression: [ :e | 
								    self
									    use: e
									    during: [ 
										    aJinDAMFileLineInput fileDescriptorReference 
											    acceptVisitor: self ] ]) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitFilePrintInto: aJinDAMFilePrintIntoClause [

	^ self
		  trace: aJinDAMFilePrintIntoClause
		  with: (writer writeFilePrintIntoInput: [ :file | 
				   file
					   fileDescriptorReference:
						   (file writeUnregisteredExpression: [ :e | 
								    self use: e during: [ 
										    aJinDAMFilePrintIntoClause fileDescriptorReference 
											    acceptVisitor: self ] ]);
					   printingReferences:
						   (file writeUnregisteredExpression: [ :e | 
								    self
									    use: e
									    during: [ 
										    aJinDAMFilePrintIntoClause printingReferences 
											    acceptVisitor: self ] ]) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitForEach: aJinDAMForEach [

	^ writer
		  for: [ :exp | 
			  self use: exp during: [ aJinDAMForEach each acceptVisitor: self ] ]
		  in: [ :exp | 
			  self
				  use: exp
				  during: [ aJinDAMForEach collection acceptVisitor: self ] ]
		  do: [ :block | 
			  self
				  use: block
				  during: [ aJinDAMForEach block acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitForNext: aJinDAMForNext [

	^ self trace: aJinDAMForNext with: (writer
			   for: [ :exp | 
				   self
					   use: exp
					   during: [ aJinDAMForNext counter acceptVisitor: self ] ]
			   from: [ :exp | 
				   self
					   use: exp
					   during: [ aJinDAMForNext initialValue acceptVisitor: self ] ]
			   to: [ :exp | 
				   self
					   use: exp
					   during: [ aJinDAMForNext limit acceptVisitor: self ] ]
			   do: [ :block | 
				   self
					   use: block
					   during: [ aJinDAMForNext block acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitForm: aJinDAMForm [

	^ writer writeDeclarationUnit: [ :unit | 
		  self use: unit during: [ self visitCollection: aJinDAMForm types ].
		  self trace: aJinDAMForm with: (unit writeForm: [ :class | 
				   class name: aJinDAMForm name.
				   self use: class during: [ 
					   aJinDAMForm superClassReference ifNotNil: [ :sc | 
						   class superclassReference:
							   (self typeReferenceFor: sc using: class) ].
					   self visitCollection: aJinDAMForm attributes.
					   self visitCollection: aJinDAMForm invocables ] ]) ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitFunction: aJinDAMFunction [

	^ self
		  trace: aJinDAMFunction
		  with: (writer writeFunction: [ :function | 
				   function selector: aJinDAMFunction selector.
				   aJinDAMFunction typeReference ifNotNil: [ 
					   function returnTypeReference:
						   (self
							    typeReferenceFor: aJinDAMFunction typeReference
							    using: function) ].
				   self use: function during: [ 
					   aJinDAMFunction parameters do: [ :p | p acceptVisitor: self ].
					   aJinDAMFunction block ifNotNil: [ :b | b acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitGoSub: aJinDAMGoSub [

	self assert: aJinDAMGoSub label size = 1.


	^ writer writeGoSub: [ :goSub | 
		  goSub writeLabelReference: [ :exp | 
			  exp labelReference:  aJinDAMGoSub label first name ] ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitGoTo: aJinDAMGoTo [

	self assert: aJinDAMGoTo labels size = 1.


	^ writer writeGoTo: [ :goSub | 
		  goSub writeLabelReference: [ :exp | 
			  exp labelReference: aJinDAMGoTo labels first name ] ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitIf: aJinDAMIf [

	^ self trace: aJinDAMIf with: (writer
			   if: [ :expression | 
				   self
					   use: expression
					   during: [ aJinDAMIf condition acceptVisitor: self ] ]
			   ifTrue: [ :ifTrueBlockWriter | 
				   aJinDAMIf ifTrue ifNotNil: [ 
					   self
						   use: ifTrueBlockWriter
						   during: [ aJinDAMIf ifTrue acceptVisitor: self ] ] ]
			   ifFalse: [ :ifFalseBlockWriter | 
				   aJinDAMIf ifFalse ifNotNil: [ 
					   self
						   use: ifFalseBlockWriter
						   during: [ aJinDAMIf ifFalse acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitInfinityLoop: aJinDAMInfinityLoop [

	^ self
		  trace: aJinDAMInfinityLoop
		  with: (writer infinityLoopDo: [ :block | 
				   self
					   use: block
					   during: [ aJinDAMInfinityLoop block acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitInitializeProcess: aJinDAMInitializeProcess [

"
	^ writer writeSubprocedure: [ :function | 
		  function selector: aJinDAMInitializeProcess selector.
		  function writeBlock: [ :block | 
			  aJinDAMInitializeProcess accesses do: [ :a | 
				  block writeStatement: [ :stmt | 
					  self use: stmt during: [ a acceptVisitor: self ] ] ] ] ]r"
]

{ #category : #visiting }
MOJinDAMModelReader >> visitJinDAMFullASTCodeImporter: aJinDAMFullASTCodeImporter [

"	Warning signal:
		'This is an error during the JinDAM importing! We will writeit down as a comment staetment '."
	^ writer noOp:
		  'This is an error during the JinDAM importing! We will writeit down as a comment staetment. We got a aJinDAMFullASTCodeImporter instead of a real JinDAM Object'
]

{ #category : #visiting }
MOJinDAMModelReader >> visitLabel: aJinDAMLabel [

	^ self
		  trace: aJinDAMLabel
		  with: (writer label: aJinDAMLabel labelName)
]

{ #category : #visiting }
MOJinDAMModelReader >> visitLibrary: aJinDAMLibrary [

	| library |
	library := self
		           trace: aJinDAMLibrary
		           with: (writer writeLibrary: [ :p | 
				            p name: aJinDAMLibrary name.
				            self use: p during: [ 
					            self visitCollection: aJinDAMLibrary globals.
					            self visitCollection: aJinDAMLibrary types.
					            self visitCollection: aJinDAMLibrary invocables ] ]).
	library name: aJinDAMLibrary name.
	^ library
]

{ #category : #visiting }
MOJinDAMModelReader >> visitLibraryReference: aJinDAMLibraryReference [

	^ self
		  trace: aJinDAMLibraryReference
		  with: (MOJinDAMVariableReferenceVisitor new
				   reader: self;
				   writer: writer;
				   arguments: {  };
				   variableReferenceFor: aJinDAMLibraryReference)
]

{ #category : #visiting }
MOJinDAMModelReader >> visitLiteralReference: aJinDAMLiteralReference [

	aJinDAMLiteralReference literalKind = 'String' ifTrue: [ 
		^ writer stringLiteral: (aJinDAMLiteralReference referee
				   copyFrom: 2
				   to: aJinDAMLiteralReference referee size - 1) ].
	aJinDAMLiteralReference literalKind = 'Boolean' ifTrue: [ 
		^ writer booleanLiteral:
			  aJinDAMLiteralReference referee asLowercase = 'true' ].
	aJinDAMLiteralReference literalKind = 'Null' ifTrue: [ 
		^ writer nullLiteral ].
	aJinDAMLiteralReference literalKind = 'Float' ifTrue: [ 
		^ writer numericLiteral: aJinDAMLiteralReference referee asNumber ].
	aJinDAMLiteralReference literalKind = 'Integer' ifTrue: [ 
		^ writer numericLiteral: aJinDAMLiteralReference referee asInteger ].
	
	aJinDAMLiteralReference literalKind = 'Color' ifTrue: [ 
		^ writer colorLiteral: aJinDAMLiteralReference referee ].
	
	aJinDAMLiteralReference literalKind = 'Date' ifTrue: [ 
		^ writer dateLiteral: aJinDAMLiteralReference referee ].
	aJinDAMLiteralReference literalKind = 'FileDescriptor' ifTrue: [ 
		^ writer fileDescriptorLiteral: aJinDAMLiteralReference referee ].
	self error: 'Unexpected literal '
]

{ #category : #visiting }
MOJinDAMModelReader >> visitLocalVariable: aJinDAMLocalVariable [

	self assert: aJinDAMLocalVariable isConstant isNil.
	self assert: aJinDAMLocalVariable initializer isNil.
	aJinDAMLocalVariable redimText
		ifNotNil: [ 
			self assert:
				aJinDAMLocalVariable instantiatesObjectOnDefinition not.

			^ self trace: aJinDAMLocalVariable with: (writer
					   redimVariable: aJinDAMLocalVariable name
					   typeReference: (self
							    typeReferenceFor: aJinDAMLocalVariable typeReference
							    using: writer)
					   redimText: aJinDAMLocalVariable redimText
					   reference:
					   (writer variableReferenceNamed: aJinDAMLocalVariable name)) ]
		ifNil: [ 
			^ self
				  trace: aJinDAMLocalVariable
				  with: (aJinDAMLocalVariable instantiatesObjectOnDefinition
						   ifTrue: [ 
							   writer
								   variable: aJinDAMLocalVariable name
								   typeReference: (self
										    typeReferenceFor: aJinDAMLocalVariable typeReference
										    using: writer)
								   initializer: [ :a | 
									   a new: (self
											    typeReferenceFor: aJinDAMLocalVariable typeReference
											    using: writer) ] ]
						   ifFalse: [ 
							   writer
								   variable: aJinDAMLocalVariable name
								   typeReference: (self
										    typeReferenceFor: aJinDAMLocalVariable typeReference
										    using: writer) ]) ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitMemberReference: aJinDAMMemberReference [

	| arguments |
	(({ #set. #let } includes: aJinDAMMemberReference name asLowercase) 
		 and: [ aJinDAMMemberReference arguments size = 1 ]) ifTrue: [ 
		^ self
			  trace: aJinDAMMemberReference
			  with:
			  (self makeAssignmentWith: aJinDAMMemberReference arguments first) ].


	arguments := self visitCollection: aJinDAMMemberReference arguments.
	^ self
		  trace: aJinDAMMemberReference
		  with: (MOJinDAMVariableReferenceVisitor new
				   reader: self;
				   writer: writer;
				   arguments: arguments;
				   variableReferenceFor: aJinDAMMemberReference)
]

{ #category : #visiting }
MOJinDAMModelReader >> visitModel: aJinDAMModel [

	| instances |
	instances := OrderedCollection new.
	aJinDAMModel accessModulesAndLibraries do: [ :a | 
		instances add: (a acceptVisitor: self) ].
	aJinDAMModel tableRelations do: [ :a | 
		instances add: (a acceptVisitor: self) ].
	^ instances 
]

{ #category : #visiting }
MOJinDAMModelReader >> visitModule: aJinDAMModule [

	^ writer writeDeclarationUnit: [ :unit | 
		  self
			  use: unit
			  during: [ self visitCollection: aJinDAMModule types ].
		  self trace: aJinDAMModule with: (unit writeModule: [ :class | 
				   class name: aJinDAMModule name.
				   self use: class during: [ 
					   self visitCollection: aJinDAMModule attributes.
					   self visitCollection: aJinDAMModule invocables ] ]) ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitNewExpression: aJinDAMNewExpression [

	^ self
		  trace: aJinDAMNewExpression
		  with: (writer writeExpression: [ :expression | 
				   expression new: (expression typeReferenceNamed:
						    aJinDAMNewExpression typeReference name) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitOnError: aJinDAMOnError [

	| label |
	self assert: aJinDAMOnError do labels size = 1.
	label := aJinDAMOnError do labels first.

	^ self
		  trace: aJinDAMOnError
		  with:
		  (writer onErrorGoTo: [ :expr |  expr labelReference: label name ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitOnErrorResumeNext: aJinDAMOnErrorResumeNext [

	^ self trace: aJinDAMOnErrorResumeNext with: writer onErrorResumeNext
]

{ #category : #visiting }
MOJinDAMModelReader >> visitOpenClause: aJinDAMFileOpenClause [

	^ self
		  trace: aJinDAMFileOpenClause
		  with: (writer writeFileOpen: [ :fo | 
				   fo
					   kind: aJinDAMFileOpenClause kind;
					   filePathReference: (fo writeUnregisteredExpression: [ :e | 
								    self
									    use: e
									    during: [ 
										    aJinDAMFileOpenClause filePathReference acceptVisitor:
												    self ] ]);
					   fileDescriptorReference:
						   (fo writeUnregisteredExpression: [ :e | 
								    self
									    use: e
									    during: [ 
										    aJinDAMFileOpenClause fileDescriptorReference 
											    acceptVisitor: self ] ]) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitParameter: aJinDAMParameter [

	self assert: aJinDAMParameter isConstant isNil.
	self assert: aJinDAMParameter instantiatesObjectOnDefinition isNil.
	self assert: aJinDAMParameter redimText isNil.

	^ self
		  trace: aJinDAMParameter
		  with: (writer writeParameter: [ :parameter | 
				   parameter name: aJinDAMParameter name.
				   self use: parameter during: [ 
					   parameter typeReference: (self
							    typeReferenceFor: aJinDAMParameter typeReference
							    using: parameter).
					   parameter isOptional: aJinDAMParameter isOptional.
					   aJinDAMParameter initializer ifNotNil: [ :init | 
						   parameter initializer: (init acceptVisitor: self) ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitParenthesis: aJinDAMParentesis [

	^ aJinDAMParentesis expression acceptVisitor: self
]

{ #category : #visiting }
MOJinDAMModelReader >> visitPrimitiveType: aJinDAMPrimitiveType [

	^ self
		  trace: aJinDAMPrimitiveType
		  with: (writer writePrimitiveType: [ :pt | 
				   pt name: aJinDAMPrimitiveType name ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitQuery: aJinDAMQuery [

	^ writer writeDeclarationUnit: [ :unit | 
		  self
			  use: unit
			  during: [ self visitCollection: aJinDAMQuery types ].
		  self trace: aJinDAMQuery with: (unit writeQuery: [ :class | 
				   class name: aJinDAMQuery name.
				   class sql: aJinDAMQuery src.
				   self use: class during: [ 
					   aJinDAMQuery superClassReference ifNotNil: [ :sc | 
						   class superclassReference:
							   (self typeReferenceFor: sc using: class) ].

					   aJinDAMQuery attributes do: [ :a | 
						   self visitAttribute: a forQuery: aJinDAMQuery ].
					   self visitCollection: aJinDAMQuery invocables ] ]) ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitRenameFile: aJinDAMRenameFile [

	^ self
		  trace: aJinDAMRenameFile
		  with: (writer writeFileRename: [ :rename | 
				   rename oldNameReference:
					   (rename writeUnregisteredExpression: [ :exp | 
						    self
							    use: exp
							    during: [ 
							    aJinDAMRenameFile oldNameReference acceptVisitor: self ] ]).
				   rename newNameReference:
					   (rename writeUnregisteredExpression: [ :exp | 
						    self
							    use: exp
							    during: [ 
							    aJinDAMRenameFile newNameReference acceptVisitor: self ] ]) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitReport: aJinDAMReport [

	^ writer writeDeclarationUnit: [ :unit | 
		  self
			  use: unit
			  during: [ self visitCollection: aJinDAMReport types ].
		  self trace: aJinDAMReport with: (unit writeReport: [ :class | 
				   class name: aJinDAMReport name.
				   self use: class during: [ 
					   aJinDAMReport superClassReference ifNotNil: [ :sc | 
						   class superclassReference:
							   (self typeReferenceFor: sc using: class) ].

					   self visitCollection: aJinDAMReport attributes.
					   self visitCollection: aJinDAMReport invocables ] ]) ]
]

{ #category : #visiting }
MOJinDAMModelReader >> visitResume: aJinDAMResume [

	| destination |
	^ self trace: aJinDAMResume with: (writer writeStatement: [ :stmt | 
			   stmt resume: [ :expr | 
				   aJinDAMResume destination collect: [ :r | 
					   expr labelReference: r name ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitResumeEmpty: aJinDAMResume [

	^ self trace: aJinDAMResume with: writer resume
]

{ #category : #visiting }
MOJinDAMModelReader >> visitResumeNext: aJinDAMResumeNext [

	^ self
		  trace: aJinDAMResumeNext
		  with: writer builder resumeNextBuilder build
]

{ #category : #visiting }
MOJinDAMModelReader >> visitReturnEmpty: aJinDAMReturnEmpty [

	^ writer writeReturn: [ :ret |  ]
]

{ #category : #enumerating }
MOJinDAMModelReader >> visitSelect: aJinDAMSelect [

	^ self trace: aJinDAMSelect with: (writer
			   select: [ :expr | 
				   self
					   use: expr
					   during: [ aJinDAMSelect expression acceptVisitor: self ] ]
			   cases: [ :select | 
				   self
					   use: select
					   during: [ self visitCollection: aJinDAMSelect cases ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitSelectCase: aJinDAMCase [

	^ self trace: aJinDAMCase with: (writer writeCase: [ :case | 
			   case
				   writeCaseExpression: [ :expr | 
					   self
						   use: expr
						   during: [ self visitCollection: aJinDAMCase expressions ] ];
				   writeBlock: [ :caseBlock | 
					   self
						   use: caseBlock
						   during: [ aJinDAMCase block acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitStructure: aJinDAMStructure [

	^ self
		  trace: aJinDAMStructure
		  with: (writer writeStructure: [ :structure | 
				   structure name: aJinDAMStructure name.
				   self
					   use: structure
					   during: [ self visitCollection: aJinDAMStructure attributes ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitSubProcedure: aJinDAMSubProcedure [

	^ self
		  trace: aJinDAMSubProcedure
		  with: (writer writeSubprocedure: [ :function | 
				   function selector: aJinDAMSubProcedure selector.

				   self use: function during: [ 
					   aJinDAMSubProcedure parameters do: [ :p | 
						   p acceptVisitor: self ].
					   aJinDAMSubProcedure block ifNotNil: [ :b | 
						   b acceptVisitor: self ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitTable: aJinDAMTable [

	^ self
		  trace: aJinDAMTable
		  with: (writer writeDeclarationUnit: [ :unit | 
				   self
					   use: unit
					   during: [ self visitCollection: aJinDAMTable types ].
				   unit writeTable: [ :class | 
					   class name: aJinDAMTable name.
					   self use: class during: [ 
						   aJinDAMTable superClassReference ifNotNil: [ :sc | 
							   class superclassReference:
								   (self typeReferenceFor: sc using: class) ].

						   self visitCollection: aJinDAMTable attributes.
						   self visitCollection: aJinDAMTable invocables.
						   class indexes: (aJinDAMTable indexes collect: [ :asoc | 
								    asoc key -> (asoc value collect: [ :iname | 
									    class attributes detect: [ :attr | attr name = iname name ] ]) ]) ] ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitTableField: aJinDAMTableField [

	^ self
		  trace: aJinDAMTableField
		  with: (writer writeAttribute: [ :attr | 
				   attr name: aJinDAMTableField name.
				   attr typeReference:
					   (self
						    typeReferenceFor: aJinDAMTableField typeReference
						    using: attr) ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitTableRelation:as [

]

{ #category : #visiting }
MOJinDAMModelReader >> visitTypeMemberReference: aJinDAMTypeMemberReference [

	| arguments |
	" Me!ControlName "
	self assert: aJinDAMTypeMemberReference name isNil.

	arguments := self visitCollection:
		             aJinDAMTypeMemberReference arguments.
	^ self
		  trace: aJinDAMTypeMemberReference
		  with: (MOJinDAMVariableReferenceVisitor new
				   reader: self;
				   writer: writer;
				   arguments: arguments;
				   variableReferenceFor: aJinDAMTypeMemberReference)
]

{ #category : #visiting }
MOJinDAMModelReader >> visitTypeReference: aJinDAMTypeReference [

	^ self
		  trace: aJinDAMTypeReference
		  with: (MOJinDAMVariableReferenceVisitor new
				   reader: self;
				   writer: writer;
				   arguments: {  };
				   variableReferenceFor: aJinDAMTypeReference)
]

{ #category : #visiting }
MOJinDAMModelReader >> visitUnaryOperation: aJinDAMUnaryOperation [

	^ self
		  trace: aJinDAMUnaryOperation
		  with: (writer writeExpression: [ :expr | 
				   self use: expr during: [ 
					   expr
						   operate: [ aJinDAMUnaryOperation operand acceptVisitor: self ]
						   operator: aJinDAMUnaryOperation operator
						   order: aJinDAMUnaryOperation order ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitUserType: aJinDAMUserType [

	^ self
		  trace: aJinDAMUserType
		  with: (writer writeStructure: [ :structure | 
				   structure name: aJinDAMUserType name.
				   structure visibility: aJinDAMUserType visibility.
				   self
					   use: structure
					   during: [ self visitCollection: aJinDAMUserType attributes ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitWhile: aJinDAMWhile [

	^ self trace: aJinDAMWhile with: (writer
			   while: [ :exp | 
				   self
					   use: exp
					   during: [ aJinDAMWhile condition acceptVisitor: self ] ]
			   do: [ :block | 
				   self
					   use: block
					   during: [ aJinDAMWhile block acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJinDAMModelReader >> visitWith: aJinDAMWith [

	^ self trace: aJinDAMWith with: (writer
			   with: [ :expr | 
				   self use: expr during: [ aJinDAMWith with acceptVisitor: self ] ]
			   do: [ :block | 
				   self
					   use: block
					   during: [ aJinDAMWith block acceptVisitor: self ] ])
]
