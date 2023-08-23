Class {
	#name : #MOModelCopyExpression,
	#superclass : #Object,
	#instVars : [
		'writer',
		'block',
		'croppingBlock',
		'bindingBlock'
	],
	#category : #'Moxing-Language-MicroBuilders'
}

{ #category : #visiting }
MOModelCopyExpression >> applyBindTo: aDestinationEntity withCandidateFrom: aProvenanceEntity [

	| candidateRelations |
	candidateRelations := aProvenanceEntity allCandidateRelations.

	self assert: candidateRelations size = 1.

	^ bindingBlock
		  value: writer
		  value: candidateRelations first
		  value: aDestinationEntity
]

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
MOModelCopyExpression >> visitArrayLiteral: aMOArrayLiteral [ 
	 ^ writer arrayLiteral: aMOArrayLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitAssignment: aMOAssignment [

	^ writer
		  let: [ :exp | self copy: aMOAssignment relation: #write ]
		  beAssignedWith: [ :exp | self copy: aMOAssignment relation: #read ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitAttributeAccess: aMOAttributeAccess [

	^ self
		applyBindTo: (writer
				 accessAttribute: aMOAttributeAccess name
				 receiver: [ :exp | 
				 self copy: aMOAttributeAccess relation: #receiverReference ])
		withCandidateFrom: aMOAttributeAccess
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
MOModelCopyExpression >> visitCharacterLiteral: aMOCharacterLiteral [ 
	^ writer characterLiteral:  aMOCharacterLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitConstantReference: aMOConstantReference [

	^ self
		  applyBindTo:
		  (writer constantReferenceNamed: aMOConstantReference name)
		  withCandidateFrom: aMOConstantReference
]

{ #category : #visiting }
MOModelCopyExpression >> visitDateLiteral: aMOAlceDateLiteral [

	^ writer dateLiteral: aMOAlceDateLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitFloatLiteral: aMOFloatLiteral [ 

	^ writer numericLiteral: aMOFloatLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitIntegerLiteral: aMOIntegerLiteral [

	^ writer numericLiteral: aMOIntegerLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitInvocation: aMOInvocation [

	^ self
		  applyBindTo: (writer
				   invocation: aMOInvocation selector
				   arguments: [ :expr | 
				   self copyAll: aMOInvocation relation: #arguments ])
		  withCandidateFrom: aMOInvocation
]

{ #category : #visiting }
MOModelCopyExpression >> visitLabelReference: aMOAlceLabelReference [

	^ self
		  applyBindTo: (writer labelReference: aMOAlceLabelReference name)
		  withCandidateFrom: aMOAlceLabelReference
]

{ #category : #visiting }
MOModelCopyExpression >> visitMethodInvocation: aMOMethodInvocation [

	^ self
		  applyBindTo: (writer
				   invokeMethodNamed: aMOMethodInvocation selector
				   receiver: [ :expr | 
				   self copy: aMOMethodInvocation relation: #receiverReference ]
				   arguments: [ :expr | 
				   self copyAll: aMOMethodInvocation relation: #arguments ])
		  withCandidateFrom: aMOMethodInvocation
]

{ #category : #visiting }
MOModelCopyExpression >> visitNamedArgument: aMONamedArgument [

	^ writer singleArgumentNamed: aMONamedArgument name expression: [ :exp | 
		  self copyAll: aMONamedArgument relation: #argumentExpressions ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitNamedSingleArgument: aMONamedSingleArgument [

	^ writer
		  singleArgumentNamed: aMONamedSingleArgument name
		  expression: [ :exp | 
			  self
				  copyAll: aMONamedSingleArgument
				  relation: #argumentExpression ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitNewExpression: aMONewInvocation [

	self assert: aMONewInvocation arguments isEmptyOrNil.

	^ self
		  applyBindTo:
		  (writer new:
			   (self copy: aMONewInvocation relation: #typeReference))
		  withCandidateFrom: aMONewInvocation
]

{ #category : #visiting }
MOModelCopyExpression >> visitNullLiteral: aMONullLiteral [

	^ writer nullLiteral
]

{ #category : #visiting }
MOModelCopyExpression >> visitPackageReference: aMOPackageReference [
  ^writer packageReferenceNamed: aMOPackageReference name
]

{ #category : #visiting }
MOModelCopyExpression >> visitParametrizedTypeReference: aMOParametrizedTypeReference [

	| arguments |
	arguments := self
		             copyAll: aMOParametrizedTypeReference
		             relation: #argumentTypeReferences.

	^ self
		  applyBindTo: (writer
				   parametrizedTypeReferenceNamed:
				   aMOParametrizedTypeReference name
				   arguments: arguments)
		  withCandidateFrom: aMOParametrizedTypeReference
]

{ #category : #visiting }
MOModelCopyExpression >> visitPragma: aMOPhPragma [
  ^writer pragma: aMOPhPragma selector arguments: [:expr |  self copyAll: aMOPhPragma relation: #arguments ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	^ self
		  applyBindTo:
		  (writer typeReferenceNamed:
			   aMOPrimitiveTypeReference name)
		  withCandidateFrom: aMOPrimitiveTypeReference
]

{ #category : #visiting }
MOModelCopyExpression >> visitSelfReference: aMOSelfReference [

	^ self
		  applyBindTo: writer referenceToSelf
		  withCandidateFrom: aMOSelfReference
]

{ #category : #visiting }
MOModelCopyExpression >> visitStCascade: aMOStCascade [
  ^writer stCascadeWith: [:exp |  self copyAll: aMOStCascade relation: #invocations ]
]

{ #category : #visiting }
MOModelCopyExpression >> visitStringLiteral: aMOStringLiteral [

	^ writer stringLiteral: aMOStringLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitSymbolicArrayLiteral: aMOArrayLiteral [ 
	 ^ writer symbolicArrayLiteral: aMOArrayLiteral literal
]

{ #category : #visiting }
MOModelCopyExpression >> visitTypeReference: aMOTypeReference [

	^ self
		  applyBindTo: (writer typeReferenceNamed: aMOTypeReference name)
		  withCandidateFrom: aMOTypeReference
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

	^ self
		  applyBindTo:
		  (writer variableReferenceNamed: aMOVariableReference name)
		  withCandidateFrom: aMOVariableReference
]

{ #category : #accessing }
MOModelCopyExpression >> writer: aMOExpressionWriter [ 
	writer := aMOExpressionWriter
]
