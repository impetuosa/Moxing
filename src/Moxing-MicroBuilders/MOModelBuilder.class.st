"
I am a ModelBuilder. 
I give access to all the micro builders and to some convenient methods.
"
Class {
	#name : #MOModelBuilder,
	#superclass : #Object,
	#instVars : [
		'model',
		'language',
		'surface'
	],
	#category : #'Moxing-MicroBuilders-core'
}

{ #category : #'as yet unclassified' }
MOModelBuilder >> aliasTypeBuilder [

	^ MOAliasTypeBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> annotationInstanceBuilder [

	^ MOModelAnnotationInstanceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> arithmeticBooleanOperatorBuilder [

	^ MOArithmeticBooleanOperationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> arithmeticBooleanUnaryOperationBuilder [

	^ MOModelUnaryBooleanOperationBuilder new
		  parentBuilder: self;
		  yourself
]

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
MOModelBuilder >> arrayAccessBuilder [

	^ MOModelArrayAccessBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> arrayedTypeReferenceBuilder [
	^ MOModelArrayTypeReferenceBuilder  new
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
MOModelBuilder >> attributeAccessorBuilder [

	^ MOModelAttributeAccessorBuilder new
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
MOModelBuilder >> blockUpdater [

	^ self blockBuilder
		  forUpdate;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> booleanLiteralBuilder [

	^ MOBooleanLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> buildExit [
"	self halt ."
	^ self instantiate: MOAlceExit 
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> caseBuilder [
	^ MOModelCaseBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> castExpressionBuilder [

	^ MOModelCastExpressionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> catchBuilder [
	^ MOModelCatchBuilder new
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
MOModelBuilder >> classFunctionBuilder [

	^ MOModelClassFunctionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> classProcedureBuilder [

	^ MOModelClassProcedureBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> classTypeBuilder [

	^ MOModelClassTypeBuilder new
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
MOModelBuilder >> constantAttributeBuilder [

	^ MOModelConstantAttributeBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> constantReferenceBuilder [

	^ MOModelConstantReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> constructorBuilder [

	^ MOModelConstructorBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> contextReferenceBuilder [

	^ MOModelContextReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> declarationUnitBuilder [

	^ MOModelDeclarationUnitBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> decoratorBuilder [


	^ MOModelDecoratorBuilder new
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
MOModelBuilder >> ensurePackagePath: aCollection [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> enumEntryBuilder [
	
	^ MOModelEnumEntryBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> exitBuilder [ 
	^ MOModelExitBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> expressionCopyHelper [
	^ MOModelCopyExpression new 
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> fileImportBuilder [

	^ MOModelFileImportBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> findInModel: aDetectionBlock ifNone: anIfNoneBlock [

	^ model entities
		  detect: [ :a | aDetectionBlock value: a ]
		  ifNone: [ anIfNoneBlock value ]
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> forEachStatementBuilder [

	^ MOModelForEachBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> forStatementBuilder [

	^ MOModelForBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> formBuilder [

	^ MOModelFormBuilder new
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
MOModelBuilder >> getModifiableVersionOf: aMOVariable [

	^ model getModifiableVersionOf: aMOVariable
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> globalConstantBuilder [

	^ MOModelGlobalConstantBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> globalVariableBuilder [

	^ MOModelGlobalVariableBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> goToBuilder [

	^ MOModelGoToBuilder new
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

{ #category : #initialization }
MOModelBuilder >> labelBuilder [

	^ MOModelLabelReferenceBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> labelReferenceBuilder [
	^ MOModelLabelReferenceBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> language [

	^ language
]

{ #category : #accessing }
MOModelBuilder >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> libraryBuilder [

	^ MOLibraryBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> localConstantBuilder [

	^ MOModelLocalConstantBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> localVariableBuilder [

	^ MOModelVariableBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> loopStatementBuilder [
	^ MOModelLoopBuilder new
		  parentBuilder: self;
		  forWhile;
		  yourself
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

{ #category : #copying }
MOModelBuilder >> modelCopyHelper [

	^ MOModelCopy new 
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> moduleBuilder [

	^ MOModelModuleBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> namedArgumentBuilder [

	^ MOModelNamedArgumentBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> newExpressionBuilder [

	^ MOModelNewExpressionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> nullLiteralBuilder [

	^ MONullLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> numericLiteralBuilder [

	^ MONumericLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'instance creation' }
MOModelBuilder >> objectBasedClassBuilder [

	^ MOModelObjectBasedClassBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> onErrorBuilder [

	^ MOModelOnErrorBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> onErrorResumeNextBuilder [

	^ MOModelOnErrorResumeNextBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
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
MOModelBuilder >> parametrizableClassBuilder [

	^ MOModelParametrizableClassBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> parametrizableClassTypeBuilder [

	^ MOModelParametrizableClassTypeBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> parametrizableMethodBuilder [

	^ MOModelParametrizableMethodBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> parametrizedTypeReferenceBuilder [
	^ MOModelParametrizedTypeReferenceBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> primitiveEnumBuilder [

	^ MOEnumBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> primitiveTypeBuilder [

	^ MOPrimitiveTypeBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'primitive types' }
MOModelBuilder >> primitiveTypeNamed: aString [

	^ model primitiveTypeNamed: aString ifAbsent: [ 
		  self primitiveTypeBuilder
			  name: aString;
			  build ]
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> primitiveTypeReferenceBuilder [

	^ MOModelPrimitiveTypeReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> primitiveTypeReferenceNamed: aString [

	^ self primitiveTypeReferenceBuilder
		  type: (self primitiveTypeNamed: aString);
		  build
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> procedureBuilder [

	^ MOModelProcedureBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> projectBuilder [

	^ MOProjectBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> queryBuilder [

	^ MOModelQueryBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> referenceToSelf [

	^ self contextReferenceBuilder
		  forSelf;
		  build
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> reportBuilder [

	^ MOModelReportBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> resumeBuilder [

	^ MOModelResumeBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> returnBuilder [

	^ MOModelReturnBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> selectBuilder [

	^ MOModelSelectBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #initialization }
MOModelBuilder >> setToReturnBuilder [

	^ MOModelSetToReturnBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> shallowCopy: aMOBlock [

	^ model shallowCopy: aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> shallowRelationCopy: aMOBlock [

	^ model shallowRelationCopy: aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> statementBuilder [

	^ MOModelStatementExpressionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #initialization }
MOModelBuilder >> statementExpressionBuilder [

	^ MOModelExpressionStatementBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> stringLiteralBuilder [

	^ MOStringLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> structureBuilder [

	^ MOModelStructureBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> surface [

	^ surface
]

{ #category : #accessing }
MOModelBuilder >> surface: anObject [

	surface := anObject
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> tableBuilder [

	^ MOModelTableBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> tryCatchBuilder [

	^ MOModelTryCatchBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> typeParameterBuilder [

	^ MOModelTypeParameterBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> typeReferenceBuilder [

	^ MOModelTypeReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'instance creation' }
MOModelBuilder >> typescriptClassBuilder [

	^ MOModelTypescriptClassBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> variableAccessorBuilder [

	^ MOModelVariableAccessorBuilder new
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
MOModelBuilder >> withBuilder [
	
	^ MOModelWithBuilder new
		  parentBuilder: self;
		  yourself
]
