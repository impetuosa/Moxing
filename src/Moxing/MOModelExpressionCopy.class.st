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
MOModelExpressionCopy >> buildCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock into: aDestination [

	writer := aDestination.
	block := aChildDelegateLoadingBlock.
	^ aProvenanceEntity acceptVisitor: self
]

{ #category : #visiting }
MOModelExpressionCopy >> copy: anEntity [
	^ block cull: writer cull: anEntity
]

{ #category : #visiting }
MOModelExpressionCopy >> visitAssignment: aMOAssignment [

	^ writer
		  let: [ :exp | self copy: aMOAssignment write ]
		  beAssignedWith: [ :exp | self copy: aMOAssignment read ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitAttributeAccess: aMOAttributeAccess [

	^ writer
		  accessAttribute: aMOAttributeAccess name
		  receiver: [ :exp | self copy: aMOAttributeAccess receiverReference  ]
]

{ #category : #visiting }
MOModelExpressionCopy >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	^ writer
		  operate: [ :e | self copy: aMOBinaryArithmeticOperation left ]
		  operator: aMOBinaryArithmeticOperation operator
		  with: [ :e | self copy: aMOBinaryArithmeticOperation right ]
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
MOModelExpressionCopy >> visitInvocation: aMOInvocation [

	^ writer
		  invokeNamed: aMOInvocation selector
		  arguments: [ :expr | 
		  aMOInvocation arguments collect: [ :a | self copy: a ] ]
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
		  self copy: aMOMethodInvocation receiverReference ]
		  arguments: [ :expr | 
			  aMOMethodInvocation arguments collect: [ :a | self copy: a ] ]
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
		  operate: [ :e | self copy: aMOUnaryArithmeticOperation operand ]
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
