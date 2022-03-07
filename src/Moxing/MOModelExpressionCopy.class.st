Class {
	#name : #MOModelExpressionCopy,
	#superclass : #MOModelCopy,
	#instVars : [
		'writer',
		'block'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelExpressionCopy >> buildCopyOf: aProvenanceEntityRelation readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	writer := aDestinationWriter.
	block := aChildDelegateLoadingBlock.
	^ aProvenanceEntityRelation to acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionCopy >> copy: anEntity relation: aRelationName [ 
	
	^ block cull: writer cull: (anEntity relationNamed: aRelationName)
]

{ #category : #visiting }
MOModelExpressionCopy >> copyAll: anEntity relation: aRelationName [

	^ (anEntity relationsNamed: aRelationName) collect: [ :relEntity | 
		  block cull: writer cull: relEntity ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitArrayAccess: aMOArrayAccess [

	^ writer
		  arrayAccess: [ :exp | 
		  self copy: aMOArrayAccess relation: #receiverReference ]
		  arguments: [ :expr | 
		  self copyAll: aMOArrayAccess relation: #arguments ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitAssignment: aMOAssignment [

	^ writer
		  let: [ :exp | self copy: aMOAssignment relation: #write ]
		  beAssignedWith: [ :exp | self copy: aMOAssignment relation: #read ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitAttributeAccess: aMOAttributeAccess [

	^ writer
		  accessAttribute: aMOAttributeAccess name
		  receiver: [ :exp | self copy: aMOAttributeAccess relation: #receiverReference  ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	^ writer
		  operate: [ :e | self copy: aMOBinaryArithmeticOperation relation: #left ]
		  operator: aMOBinaryArithmeticOperation operator
		  with: [ :e | self copy: aMOBinaryArithmeticOperation relation: #right ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitBooleanLiteral: aMOBooleanLiteral [ 
	^ writer booleanLiteral: aMOBooleanLiteral literal
]

{ #category : #visiting }
MOModelExpressionCopy >> visitConstantReference: aMOConstantReference [ 
	^ writer constantReferenceNamed: aMOConstantReference name
]

{ #category : #visiting }
MOModelExpressionCopy >> visitIntegerLiteral: aMOIntegerLiteral [

	^ writer numericLiteral: aMOIntegerLiteral literal
]

{ #category : #visiting }
MOModelExpressionCopy >> visitInvocation: aMOInvocation [

	^ writer
		  invokeNamed: aMOInvocation selector
		  arguments: [ :expr | 
		  self copyAll: aMOInvocation relation: #arguments ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitLabelReference: aMOAlceLabelReference [ 
	^ writer labelReference: aMOAlceLabelReference name 
]

{ #category : #visiting }
MOModelExpressionCopy >> visitMethodInvocation: aMOMethodInvocation [

	^ writer
		  invokeMethodNamed: aMOMethodInvocation selector
		  receiver: [ :expr | 
		  self copy: aMOMethodInvocation relation: #receiverReference ]
		  arguments: [ :expr | 
		  self copyAll: aMOMethodInvocation relation: #arguments ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitNewExpression: aMONewInvocation [

	self assert: aMONewInvocation arguments isEmptyOrNil.

	^ writer new: (self copy: aMONewInvocation relation: #typeReference)
]

{ #category : #visiting }
MOModelExpressionCopy >> visitNullLiteral: aMONullLiteral [

	^ writer nullLiteral
]

{ #category : #visiting }
MOModelExpressionCopy >> visitStringLiteral: aMOStringLiteral [

	^ writer stringLiteral: aMOStringLiteral literal
]

{ #category : #visiting }
MOModelExpressionCopy >> visitTypeReference: aMOTypeReference [ 
	^ writer typeReferenceNamed: aMOTypeReference name
]

{ #category : #visiting }
MOModelExpressionCopy >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	^ writer
		  operate: [ :e | self copy: aMOUnaryArithmeticOperation relation: #operand ]
		  operator: aMOUnaryArithmeticOperation operator
		  order: aMOUnaryArithmeticOperation order
]

{ #category : #visiting }
MOModelExpressionCopy >> visitVariableReference: aMOVariableReference [ 
	^ writer variableReferenceNamed: aMOVariableReference name
]

{ #category : #accessing }
MOModelExpressionCopy >> writer: aMOExpressionWriter [ 
	writer := aMOExpressionWriter
]
