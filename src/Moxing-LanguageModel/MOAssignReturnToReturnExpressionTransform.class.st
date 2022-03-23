Class {
	#name : #MOAssignReturnToReturnExpressionTransform,
	#superclass : #MOModelToModelTransform,
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOAssignReturnToReturnExpressionTransform class >> appliesToStatement: aMOReturn [

	^ MOReturnAssignmentPolicy appliesToStatement: aMOReturn
]

{ #category : #'as yet unclassified' }
MOAssignReturnToReturnExpressionTransform >> apply: aMOReturn model: aMOModel [ 
	" If the return "
	self halt. 
]

{ #category : #'as yet unclassified' }
MOAssignReturnToReturnExpressionTransform >> calculateNewNodeFor: aMOExit onTheContext: anUndefinedObject with: aMOTransformationApplier [

	| returningVariable method return reference |
	method := self lookUpForOwningMethod: aMOExit.

	method type isVoid ifTrue: [ 
		^ aMOTransformationApplier instantiate: MOReturnEmpty for: aMOExit ].
	returningVariable := method block statements first.

	return := aMOTransformationApplier instantiate: MOReturn for: aMOExit.
	reference := aMOTransformationApplier instantiate:
		             MOVariableReference.
	reference variable: returningVariable.
	return expression: reference.
	^ return
]

{ #category : #'as yet unclassified' }
MOAssignReturnToReturnExpressionTransform >> endTransformation: aMOTransformationApplier [ 

	" nothing to do "
]
