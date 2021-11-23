Class {
	#name : #MOTransformationApplier,
	#superclass : #Object,
	#instVars : [
		'transformations',
		'writer',
		'transformInstances'
	],
	#category : #Moxing
}

{ #category : #'instance creation' }
MOTransformationApplier class >> newFuctionOrProcedureLevelApplication [

	^ self new
]

{ #category : #'instance creation' }
MOTransformationApplier class >> newMethodLevelApplication [

	^ self new
]

{ #category : #public }
MOTransformationApplier >> apply: aClass to: aMOExit [

	| newNode tr |
	tr := self transformInstance: aClass for: aMOExit.
	tr ifNotNil: [ 
		newNode := tr
			           calculateNewNodeFor: aMOExit
			           onTheContext: aMOExit parent
			           with: self ]
]

{ #category : #'as yet unclassified' }
MOTransformationApplier >> basicVisitEntity: aMOVariable [

	transformations keys
		detect: [ :k | k appliesToStatement: aMOVariable ]
		ifFound: [ :k | self apply: k to: aMOVariable ]
]

{ #category : #'as yet unclassified' }
MOTransformationApplier >> endTransformations [

	transformInstances ifNotNil: [ :inst | 
		inst values do: [ :t | t endTransformation: self ] ]
]

{ #category : #visiting }
MOTransformationApplier >> instantiate: aClass [

	^ writer instantiate: aClass
]

{ #category : #visiting }
MOTransformationApplier >> instantiate: aClass for: aMOExit [

	| newNode |
	newNode := writer instantiate: aClass forReplacing: aMOExit.
	writer swap: aMOExit with: newNode context: aMOExit parent.
	^ newNode
]

{ #category : #accessing }
MOTransformationApplier >> transform: aMOMethod [

	" here i am expecting to refactorize to multiple subclasses according to the entity to transform. but so far i have only one. "


	aMOMethod acceptVisitor: self.
	self endTransformations. 
]

{ #category : #'as yet unclassified' }
MOTransformationApplier >> transformInstance: aClass for: aMOExit [

	^ self transformInstances
		  at: { 
				  aClass.
				  aMOExit }
		  ifAbsent: [ 
			  (transformations at: aClass) values
				  detect: [ :policy | policy appliesToStatement: aMOExit ]
				  ifFound: [ :t | 
					  self transformInstances
						  at: { 
								  aClass.
								  aMOExit }
						  put: t new ]
				  ifNone: [ nil ] ]
]

{ #category : #'as yet unclassified' }
MOTransformationApplier >> transformInstanceFor: aClass [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
MOTransformationApplier >> transformInstances [

	^ transformInstances ifNil: [ transformInstances := Dictionary new ]
]

{ #category : #accessing }
MOTransformationApplier >> transformations: aCollection [

	transformations := aCollection
]

{ #category : #visiting }
MOTransformationApplier >> visitAssignment: aMOAssignment [ 
	aMOAssignment read acceptVisitor: self .
	aMOAssignment write acceptVisitor: self .
	self basicVisitEntity: aMOAssignment.
	
]

{ #category : #visiting }
MOTransformationApplier >> visitBlock: aMOBlock [ 
	self visitCollection:  aMOBlock statements 
]

{ #category : #visiting }
MOTransformationApplier >> visitBooleanLiteral: aMOBooleanLiteral [ 
	self basicVisitEntity: aMOBooleanLiteral 
]

{ #category : #visiting }
MOTransformationApplier >> visitCollection: aCollection [
	aCollection isString ifTrue: [ ^ self  ].
	aCollection do: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOTransformationApplier >> visitExit: aMOExit [ 
	self basicVisitEntity: aMOExit 
]

{ #category : #visiting }
MOTransformationApplier >> visitIfElse: aMOIfElse [

	self basicVisitEntity: aMOIfElse
]

{ #category : #visiting }
MOTransformationApplier >> visitInvocableInvocation: aFylgjaMissingInvocableInvocation [

	self basicVisitEntity: aFylgjaMissingInvocableInvocation
]

{ #category : #visiting }
MOTransformationApplier >> visitInvocation: aMOInvocation [

	self basicVisitEntity: aMOInvocation
]

{ #category : #visiting }
MOTransformationApplier >> visitLabel: aMOLabel [

	self basicVisitEntity: aMOLabel
]

{ #category : #visiting }
MOTransformationApplier >> visitLiteral: aMOBooleanLiteral [ 
	self basicVisitEntity: aMOBooleanLiteral 
]

{ #category : #visiting }
MOTransformationApplier >> visitMethod: aMOMethod [

	self visitCollection: aMOMethod parameters.
	aMOMethod type acceptVisitor: self.
	aMOMethod block acceptVisitor: self
]

{ #category : #visiting }
MOTransformationApplier >> visitOnErrorGoToLabel: aMOOnErrorGoToLabel [ 
	self basicVisitEntity: aMOOnErrorGoToLabel 
]

{ #category : #visiting }
MOTransformationApplier >> visitOperator: aFylgjaMissingOperator [

	aFylgjaMissingOperator left acceptVisitor: self.
	self visitCollection: aFylgjaMissingOperator right.
	self basicVisitEntity: aFylgjaMissingOperator
]

{ #category : #visiting }
MOTransformationApplier >> visitProcedure: aMOProcedure [

	self visitCollection: aMOProcedure parameters.
	aMOProcedure block acceptVisitor: self
]

{ #category : #visiting }
MOTransformationApplier >> visitResumeFromLabel: aMOResumeFromLabel [

	self basicVisitEntity: aMOResumeFromLabel
]

{ #category : #visiting }
MOTransformationApplier >> visitReturn: aMOReturn [ 
	self basicVisitEntity: aMOReturn 
]

{ #category : #visiting }
MOTransformationApplier >> visitStringLiteral: aMOStringLiteral [ 
	self basicVisitEntity: aMOStringLiteral 
]

{ #category : #visiting }
MOTransformationApplier >> visitTypeReference: aFylgjaMissingType [ 
	^ self basicVisitEntity: aFylgjaMissingType
]

{ #category : #visiting }
MOTransformationApplier >> visitVariable: aMOVariable [
	self basicVisitEntity: aMOVariable 
]

{ #category : #visiting }
MOTransformationApplier >> visitVariableReference: aMOVariableRererence [

	self basicVisitEntity: aMOVariableRererence
]

{ #category : #accessing }
MOTransformationApplier >> writer: aMOJavaModelWriter [

	writer := aMOJavaModelWriter
]
