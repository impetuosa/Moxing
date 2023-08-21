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
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelBuilder >> aliasTypeBuilder [

	^ MOAliasTypeBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> angularComponentBuilder [

	^ MOModelAngularComponentBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> angularModuleBuilder [

	^ MOModelAngularModuleBuilder new
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
MOModelBuilder >> arrayLiteralBuilder [
	^ MOArrayLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> arrayedTypeReferenceBuilder [
	^ MOModelArrayTypeReferenceBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> artefactReferenceBuilder [
	^ MOModelArtefactReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> assertionStatementBuilder [
	^ MOAssertionStatementBuilder new
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
MOModelBuilder >> blockClosureBuilder [
	^ MOStBlockClosureBuilder new
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
MOModelBuilder >> breakBuilder [
	^ MOModelBreakBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> buildExit [
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

{ #category : #'as yet unclassified' }
MOModelBuilder >> charLiteralBuilder [
	^ MOCharacterLiteralBuilder new
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
MOModelBuilder >> classVariableBuilder [
	^ MOModelClassVariableBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> colorLiteralBuilder [
	^ MOColorLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> commentBuilder [ 
	^ MOModelCommentBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> comparisonOperatorBuilder [
	^ MOComparisonOperationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> conditionalExpressionBuilder [
	^ MOModelConditionalExpressionBuilder new
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
MOModelBuilder >> constructorInvocationBuilder [
	^ MOConstructorInvocationBuilder new
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
MOModelBuilder >> continueBuilder [
	^ MOModelContinueBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> cssDocumentBuilder [
	^ MOModelAngularCssDocumentBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> dateLiteralBuilder [
	^ MODateLiteralBuilder new
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
MOModelBuilder >> dictionaryLiteralBuilder [
	^ MODictionaryLiteralBuilder new
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
MOModelBuilder >> eventBuilder [
	^ MOModelEventBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> expressionCopyHelper [
	^ MOModelCopyExpression new 
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> externalFunctionBuilder [
	^ MOModelExternalFunctionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> externalProcedureBuilder [
	^ MOModelExternalProcedureBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> fileDescriptorLiteralBuilder [
	^ MOFileDescriptorLiteralBuilder new
		  parentBuilder: self;
		  yourself
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
MOModelBuilder >> forNextStatementBuilder [
	^ MOModelForNextBuilder new
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
MOModelBuilder >> functionBuilder [
	^ MOModelFunctionBuilder new
		  parentBuilder: self;
		  yourself
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

{ #category : #'as yet unclassified' }
MOModelBuilder >> infinityLoopBuilder [
	^ MOModelInfinityLoopBuilder new
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

{ #category : #'as yet unclassified' }
MOModelBuilder >> javaClassBuilder [
	^ MOModelJavaClassBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> javaClassTypeBuilder [
	^ MOModelJavaClassTypeBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #initialization }
MOModelBuilder >> labelBuilder [
	^ MOModelLabelBuilder new
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

{ #category : #initialization }
MOModelBuilder >> labelWithStatementBuilder [
	^ MOModelLabelWithStatementBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> lambdaBuilder [
	^ MOLambdaBuilder new
		  parentBuilder: self;
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
MOModelBuilder >> metaclassBuilder [
	^ MOModelMetaClassBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> methodAccessBuilder [
	^ MOModelMethodAccessBuilder new
		  parentBuilder: self;
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
MOModelBuilder >> namedArgumentsBuilder [
	^ MOModelNamedArgumentsBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> namedSingleArgumentBuilder [
	^ MOModelNamedSingleArgumentBuilder new
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
MOModelBuilder >> noOpBuilder [
	^ MOModelNoOpBuilder new
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
MOModelBuilder >> parametrizableMethodInvocationBuilder [
	^ MOModelParametrizableMethodInvocationBuilder new
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
MOModelBuilder >> pragmaBuilder [
	^ MOModelPhPragmaBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> primitiveEnumBuilder [
	^ MOEnumBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> primitiveJavaEnumBuilder [
	^ MOModelJavaEnumBuilder new
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

{ #category : #accessing }
MOModelBuilder >> qualifiedTypeReferenceBuilder [
	^ MOModelQualifiedTypeReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> queryAttributeBuilder [
	^ MOModelQueryAttributeBuilder new
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
MOModelBuilder >> referenceToSuper [
	^ self contextReferenceBuilder
		  forSuper;
		  build
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> referenceToThisContext [
	^ self contextReferenceBuilder
		  forThisContext;
		  build
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> returnBuilder [
	^ MOModelReturnBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> rootDeclarationBuilder [
	^ MORootDeclarationBuilder new
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
MOModelBuilder >> sharedConstantBuilder [
	^ MOModelSharedConstantBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> sharedPoolReferenceBuilder [
	^ MOModelPhSharedPoolReferenceBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> sharedVariableBuilder [
	^ MOModelSharedVariableBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> smalltalkClassBuilder [
	^ MOModelStClassBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> stArrayExpressionBuilder [

	^ MOStArrayExpressionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> stCascadeBuilder [

	^ MOStCascadeBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> stExensionMethodDeclarationUnitBuilder [
  ^MOStExensionMethodDeclarationUnitBuilder new
     parentBuilder: self;
     yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> stMethodBuilder [
  ^MOStModelMethodBuilder new
     parentBuilder: self;
     yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> statementBuilder [

	^ MOModelStatementExpressionBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> statementDeclarationBuilder [
	^ MOModelStatementDeclarationBuilder new
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
MOModelBuilder >> staticInitializerBuilder [

	^ MOModelStaticInitializerBuilder new
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
MOModelBuilder >> switchBlockBuilder [
	 ^ MOModelSwitchBlockBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> switchBuilder [
	 ^ MOModelSwitchBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> symbolicArrayLiteralBuilder [
	^ MOStSymbolicArrayLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> synchronizedStatementBuilder [
	 ^ MOModelSynchronizedBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> templateDocumentBuilder [

	^ MOModelAngularTemplateDocumentBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> templateLiteralBuilder [ 

	^ MOTemplateLiteralBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> throwBuilder [

	^ MOModelThrowBuilder new
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
MOModelBuilder >> typeAccessBuilder [

	^ MOModelArtefactTypeReferenceBuilder new
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

{ #category : #'instance creation' }
MOModelBuilder >> visualWorksPackageBuilder [

	^ MOModelVisualWorksPackageBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelBuilder >> withBuilder [
	
	^ MOModelWithBuilder new
		  parentBuilder: self;
		  yourself
]
