Class {
	#name : #MOModelBuilder,
	#superclass : #Object,
	#instVars : [
		'model',
		'language',
		'surface'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelBuilder >> arithmeticOperatorBuilder [

	^ MOArithmeticOperationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> arithmeticUnaryOperationBuilder [

	^ MOModelUnaryArithmeticOperationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> assignmentBuilder [

	^ MOModelAssignmentBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> attributeAccessBuilder [

	^ MOModelAttributeAccessBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> attributeBuilder [

	^ MOModelAttributeBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> blockBuilder [

	^ MOModelBlockBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> booleanLiteralBuilder [

	^ MOBooleanLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> castExpressionBuilder [

	^ MOModelCastExpressionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'instance creation' }
MOModelBuilder >> classBuilder [

	^ MOModelClassBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> comparisonOperatorBuilder [

	^ MOComparisonOperationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> doUntilStatementBuilder [

	^ MOModelLoopBuilder new
		  parentBuilder: self;
		  forDoUntil;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> forStatementBuilder [

	^ MOModelForBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> functionBuilder [

	^ MOModelFunctionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> ifStatementBuilder [
	 ^ MOModelIfElseBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> importBuilder [

	^ MOModelImportBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'instance creation' }
MOModelBuilder >> initialize [

	super initialize.
	
]

{ #category : #'instance creation' }
MOModelBuilder >> instantiate: aLangClass [

	^ (model instantiate: aLangClass)
		  language: language;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> invocationBuilder [

	^ MOModelInvocationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> methodBuilder [

	^ MOModelMethodBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> methodInvocationBuilder [

	^ MOModelMethodInvocationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> model [
	^ model
]

{ #category : #accessing }
MOModelBuilder >> model: aModel [ 
	 model := aModel
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> numericLiteralBuilder [

	^ MONumericLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'instance creation' }
MOModelBuilder >> packageBuilder [

	^ MOModelPackageBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'instance creation' }
MOModelBuilder >> packageReferenceBuilder [

	^ MOModelPackageReferenceBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> parameterBuilder [

	^ MOModelParameterBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> procedureBuilder [

	^ MOModelProcedureBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> returnBuilder [

	^ MOModelReturnBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> stringLiteralBuilder [

	^ MOStringLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> typeReferenceBuilder [

	^ MOModelTypeReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> variableBuilder [

	^ MOModelVariableBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> variableReferenceBuilder [

	^ MOModelVariableReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> whileStatementBuilder [

	^ MOModelLoopBuilder new
		  parentBuilder: self;
		  forWhile;
		  yourself
]
