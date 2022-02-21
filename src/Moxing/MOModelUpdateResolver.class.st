"
I know how to resolve the object that knows how to update a given entity 
"
Class {
	#name : #MOModelUpdateResolver,
	#superclass : #Object,
	#instVars : [
		'writingBlock',
		'writer',
		'writingEntity'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOModelUpdateResolver >> genericUpdate: aMOBinaryArithmeticOperation [
	^ writer
		  genericUpdate: aMOBinaryArithmeticOperation
		  with: [ :block | writingBlock cull: writingEntity cull: block ]
]

{ #category : #'as yet unclassified' }
MOModelUpdateResolver >> resolveWriterFor: aProvenanceEntity forUpdating: aDestinationContext writingContext: aContextWriter do: aFullBlockClosure [

	writer := aContextWriter.
	writingEntity := aProvenanceEntity.
	writingBlock := aFullBlockClosure.
	^ self updateEntity: aDestinationContext
]

{ #category : #'as yet unclassified' }
MOModelUpdateResolver >> updateEntity: aMOBlock [

	^ aMOBlock acceptVisitor: self
]

{ #category : #visiting }
MOModelUpdateResolver >> visitAccessor: aMOAccessor [

	| addedElement |
	writer updateAccessor: aMOAccessor with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitArrayAccess: aMOArrayAccess [

	^ self genericUpdate: aMOArrayAccess
]

{ #category : #visiting }
MOModelUpdateResolver >> visitAssignment: aMOAssignment [

	^ self genericUpdate: aMOAssignment
]

{ #category : #visiting }
MOModelUpdateResolver >> visitAttribute: aMOAttribute [

	| addedElement |
	writer updateAttribute: aMOAttribute with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitAttributeAccess: aMOAttributeAccess [

	^ self genericUpdate: aMOAttributeAccess
]

{ #category : #visiting }
MOModelUpdateResolver >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [
	^ self genericUpdate: aMOBinaryArithmeticOperation
]

{ #category : #visiting }
MOModelUpdateResolver >> visitBlock: aMOBlock [

	| statement |
	writer
		updateBlock: aMOBlock
		with: [ :block | 
		statement := writingBlock cull: writingEntity cull: block ].
	^ statement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitCase: aMOCase [

	| addedElement |
	writer updateCase: aMOCase with: [ :classWriter | 
		addedElement := writingBlock cull: writingEntity cull: classWriter ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitClass: aMOClass [

	| addedElement |
	writer updateClass: aMOClass with: [ :classWriter | 
		addedElement := writingBlock cull: writingEntity cull: classWriter ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitConstant: aMOConstant [

	| addedElement |
	writer updateConstant: aMOConstant with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitEmptyBlock: aMOEmptyBlock [

	| statement |
	writer
		updateBlock: aMOEmptyBlock
		with: [ :block | 
		statement := writingBlock cull: writingEntity cull: block ].
	^ statement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitEnum: aMOEnum [

	| addedElement |

	writer updateEnum: aMOEnum with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitFunction: aMOFunction [ 
	| addedElement |
	writer updateFunction: aMOFunction with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitIfElse: aMOIfElse [
	^ writer 
		  updateIfElse: aMOIfElse
		  with: [ :block | writingBlock cull: writingEntity cull: block ]
]

{ #category : #visiting }
MOModelUpdateResolver >> visitInvocation: aMOInvocation [ 
	^ self genericUpdate: aMOInvocation
]

{ #category : #visiting }
MOModelUpdateResolver >> visitMethod: aMOMethod [

	| addedElement |
	writer updateMethod: aMOMethod with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitMethodInvocation: aMOMethodInvocation [ 
	^ self genericUpdate: aMOMethodInvocation
]

{ #category : #visiting }
MOModelUpdateResolver >> visitModule: aMOModule [

	| addedElement |
	writer updateModule: aMOModule with: [ :classWriter | 
		addedElement := writingBlock cull: writingEntity cull: classWriter ].

	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitOnErrorGoToLabel: aMOAlceOnErrorGoToLabel [

	^ self genericUpdate: aMOAlceOnErrorGoToLabel
]

{ #category : #visiting }
MOModelUpdateResolver >> visitPackage: aMOPackage [

	^ self genericUpdate: aMOPackage
]

{ #category : #visiting }
MOModelUpdateResolver >> visitParameter: aMOParameter [

	^ writer
		  updateParameter: aMOParameter
		  with: [ :entity | writingBlock cull: writingEntity cull: entity ]
]

{ #category : #visiting }
MOModelUpdateResolver >> visitProcedure: aMOProcedure [

	| addedElement |

	writer updateProcedure: aMOProcedure with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitResumeLabel: aMOAlceResumeLabel [

	^ self genericUpdate: aMOAlceResumeLabel
]

{ #category : #enumerating }
MOModelUpdateResolver >> visitSelect: aMOSelect [

	| addedElement |
	writer updateSelect: aMOSelect with: [ :classWriter | 
		addedElement := writingBlock cull: writingEntity cull: classWriter ].

	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitSetToReturn: aMOSetToReturn [ 

	^ self genericUpdate: aMOSetToReturn 
]

{ #category : #visiting }
MOModelUpdateResolver >> visitStatementExpression: aMOStatementExpression [

	^ self genericUpdate: aMOStatementExpression
]

{ #category : #visiting }
MOModelUpdateResolver >> visitStructure: aMOStructure [

	| addedElement |
	writer updateStructure: aMOStructure with: [ :classWriter | 
		addedElement := writingBlock cull: writingEntity cull: classWriter ].

	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [ 
^ self genericUpdate: aMOUnaryArithmeticOperation
]

{ #category : #visiting }
MOModelUpdateResolver >> visitVariable: aMOVariable [

	| addedElement |
	writer updateVariable: aMOVariable with: [ :block | 
		addedElement := writingBlock cull: writingEntity cull: block ].
	^ addedElement
]

{ #category : #visiting }
MOModelUpdateResolver >> visitWhile: aMOWhile [ 

	| addedElement |
	writer updateWhile: aMOWhile with: [ :classWriter | 
		addedElement := writingBlock cull: writingEntity cull: classWriter ].

	^ addedElement
]
