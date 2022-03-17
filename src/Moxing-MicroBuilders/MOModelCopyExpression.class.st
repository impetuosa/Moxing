Class {
	#name : #MOModelCopyExpression,
	#superclass : #Object,
	#instVars : [
		'writer',
		'block',
		'croppingBlock',
		'bindingBlock'
	],
	#category : #'Moxing-MicroBuilders-core'
}

{ #category : #'as yet unclassified' }
MOModelCopyExpression >> buildCopyOf: aProvenanceEntity croppingWith: aBlock readingValues: aChildDelegateLoadingBlock bindingWithCandidates: aBindingBlock into: aDestinationWriter [

	writer := aDestinationWriter.
	block := aChildDelegateLoadingBlock.
	bindingBlock := aBindingBlock.
	croppingBlock := aBlock.

	^ aProvenanceEntity to acceptVisitor: self
]

{ #category : #visiting }
MOModelCopyExpression >> copy: anEntity relation: aRelationName [ 
	
	^ block cull: writer cull: (anEntity relationNamed: aRelationName)
]

{ #category : #visiting }
MOModelCopyExpression >> copyAll: anEntity relation: aRelationName [

	^ (anEntity relationsNamed: aRelationName) collect: [ :relEntity | 
		  block cull: writer cull: relEntity ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitArrayAccess: aMOArrayAccess [

	^ writer
		  arrayAccess: [ :exp | 
		  self copy: aMOArrayAccess relation: #receiverReference ]
		  arguments: [ :expr | 
		  self copyAll: aMOArrayAccess relation: #arguments ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitAssignment: aMOAssignment [

	^ writer
		  let: [ :exp | self copy: aMOAssignment relation: #write ]
		  beAssignedWith: [ :exp | self copy: aMOAssignment relation: #read ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitAttributeAccess: aMOAttributeAccess [
	^ writer
		  accessAttribute: aMOAttributeAccess name
		  receiver: [ :exp | 
		  self copy: aMOAttributeAccess relation: #receiverReference ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	^ writer
		  operate: [ :e | self copy: aMOBinaryArithmeticOperation relation: #left ]
		  operator: aMOBinaryArithmeticOperation operator
		  with: [ :e | self copy: aMOBinaryArithmeticOperation relation: #right ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitBooleanLiteral: aMOBooleanLiteral [ 
	^ writer booleanLiteral: aMOBooleanLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitConstantReference: aMOConstantReference [ 
	^ writer constantReferenceNamed: aMOConstantReference name
]

{ #category : #visiting }
MOModelCopyExpression >> visitIntegerLiteral: aMOIntegerLiteral [

	^ writer numericLiteral: aMOIntegerLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitInvocation: aMOInvocation [

	^ writer
		  invocation: aMOInvocation selector
		  arguments: [ :expr | 
		  self copyAll: aMOInvocation relation: #arguments ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitLabelReference: aMOAlceLabelReference [ 
	^ writer labelReference: aMOAlceLabelReference name 
]

{ #category : #visiting }
MOModelCopyExpression >> visitMethodInvocation: aMOMethodInvocation [

	^ writer
		  invokeMethodNamed: aMOMethodInvocation selector
		  receiver: [ :expr | 
		  self copy: aMOMethodInvocation relation: #receiverReference ]
		  arguments: [ :expr | 
		  self copyAll: aMOMethodInvocation relation: #arguments ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitNewExpression: aMONewInvocation [

	self assert: aMONewInvocation arguments isEmptyOrNil.

	^ writer new: (self copy: aMONewInvocation relation: #typeReference)
]

{ #category : #visiting }
MOModelCopyExpression >> visitNullLiteral: aMONullLiteral [

	^ writer nullLiteral
]

{ #category : #visiting }
MOModelCopyExpression >> visitSelfReference: aMOSelfReference [ 
	^ writer referenceToSelf 
]

{ #category : #visiting }
MOModelCopyExpression >> visitStringLiteral: aMOStringLiteral [

	^ writer stringLiteral: aMOStringLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitTypeReference: aMOTypeReference [ 
	^ writer typeReferenceNamed: aMOTypeReference name
]

{ #category : #visiting }
MOModelCopyExpression >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	^ writer
		  operate: [ :e | self copy: aMOUnaryArithmeticOperation relation: #operand ]
		  operator: aMOUnaryArithmeticOperation operator
		  order: aMOUnaryArithmeticOperation order
]

{ #category : #visiting }
MOModelCopyExpression >> visitVariableReference: aMOVariableReference [

	| copy  |
	copy := writer variableReferenceNamed: aMOVariableReference name.
	aMOVariableReference allCandidateRelations collect: [ :rel | 
		copy := bindingBlock value: writer value: rel value: copy ].
	^ copy
]

{ #category : #accessing }
MOModelCopyExpression >> writer: aMOExpressionWriter [ 
	writer := aMOExpressionWriter
]
