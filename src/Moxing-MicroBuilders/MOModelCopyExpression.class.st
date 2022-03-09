Class {
	#name : #MOModelCopyExpression,
	#superclass : #Object,
	#instVars : [
		'writer',
		'block'
	],
	#category : #'Moxing-MicroBuilders-core'
}

{ #category : #accessing }
MOModelCopyExpression >> buildCopyOf: aProvenanceEntityRelation readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [
	writer := aDestinationWriter.
	block := aChildDelegateLoadingBlock.
	^ aProvenanceEntityRelation to acceptVisitor: self
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
		  receiver: [ :exp | self copy: aMOAttributeAccess relation: #receiverReference  ]
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
		  invokeNamed: aMOInvocation selector
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
	^ writer variableReferenceNamed: aMOVariableReference name
]

{ #category : #accessing }
MOModelCopyExpression >> writer: aMOExpressionWriter [ 
	writer := aMOExpressionWriter
]
