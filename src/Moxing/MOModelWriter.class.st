"
I represent a model writer. I know how and where to add. 
I give the entry point for writing first class citizens: writeClass, writePackage, etc 
"
Class {
	#name : #MOModelWriter,
	#superclass : #Object,
	#instVars : [
		'model',
		'builder',
		'entity',
		'anchoringOn'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOModelWriter >> addAccessor: aMOAccessor [

	entity := aMOAccessor
]

{ #category : #adding }
MOModelWriter >> addArtefact: aMOProject [

	entity := aMOProject
]

{ #category : #adding }
MOModelWriter >> addCase: aMOCase [

	entity := aMOCase
]

{ #category : #adding }
MOModelWriter >> addClass: aMOClass [

	self assert: (aMOClass isKindOf: MOClass).
	entity := aMOClass
]

{ #category : #adding }
MOModelWriter >> addClassType: aMOClassType [

	self assert: (aMOClassType isKindOf: MOClassType).
	self assert:
		(model types select: [ :t | t fullName = aMOClassType fullName ])
			size = 1.
	entity := aMOClassType
]

{ #category : #adding }
MOModelWriter >> addConstant: aMOConstant [

	entity := aMOConstant
]

{ #category : #adding }
MOModelWriter >> addDeclarationUnit: aMODeclarationUnit [

	entity := aMODeclarationUnit
]

{ #category : #adding }
MOModelWriter >> addEnum: aMOEnum [

	self assert: (aMOEnum isKindOf: MOEnum).
	entity := aMOEnum
]

{ #category : #adding }
MOModelWriter >> addFunction: aMOFunction [ 
	entity :=  aMOFunction. 
	
]

{ #category : #adding }
MOModelWriter >> addImport: aMOImport [

	entity := aMOImport
]

{ #category : #adding }
MOModelWriter >> addMethod: aMOMethod [

	entity := aMOMethod
]

{ #category : #adding }
MOModelWriter >> addModule: aMOModule [

	self assert: (aMOModule isKindOf: MOModule).
	entity := aMOModule
]

{ #category : #adding }
MOModelWriter >> addPackage: aMOPackage [

	self assert: (model entities includes: aMOPackage).
	entity := aMOPackage
]

{ #category : #adding }
MOModelWriter >> addParameter: aMOParameter [

	entity := aMOParameter
]

{ #category : #adding }
MOModelWriter >> addProcedure: aMOProcedure [

	entity := aMOProcedure
]

{ #category : #adding }
MOModelWriter >> addStatement: aMOMethodInvocation [
	entity := aMOMethodInvocation
]

{ #category : #adding }
MOModelWriter >> addStructureType: aMOStructure [

	entity := aMOStructure
]

{ #category : #adding }
MOModelWriter >> addVariable: aMOVariable [

	entity := aMOVariable
]

{ #category : #accessing }
MOModelWriter >> anchor [
	^ anchoringOn
]

{ #category : #'as yet unclassified' }
MOModelWriter >> anchoringOn: aMOAnchor [

	anchoringOn := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOModelWriter >> arrayTypeReferenceOf: aMOTypeReference [

	^ builder arrayedTypeReferenceBuilder
		  baseType: aMOTypeReference;
		  build
]

{ #category : #generated }
MOModelWriter >> block: aMOBlock [ 
	entity := aMOBlock.
	
]

{ #category : #writing }
MOModelWriter >> builder [

	^ builder ifNil: [ 
		  builder := MOModelBuilder new.
		  builder model: model.
		  builder language: model language. 
		  builder ]
]

{ #category : #accessing }
MOModelWriter >> builder: aMOModelBuilder [ 
	builder := aMOModelBuilder
]

{ #category : #'as yet unclassified' }
MOModelWriter >> constantReferenceNamed: aString [

	^ self builder constantReferenceBuilder
		  name: aString;
		  build
]

{ #category : #accessing }
MOModelWriter >> entity [
	^ entity
]

{ #category : #'as yet unclassified' }
MOModelWriter >> genericUpdate: aMOAssignment with: aFullBlockClosure [

	^ aFullBlockClosure value: self
]

{ #category : #initialization }
MOModelWriter >> handlesTypeReferences [

	^ false
]

{ #category : #accessing }
MOModelWriter >> model [
	^ model
]

{ #category : #accessing }
MOModelWriter >> model: aMOModel [ 
	model := aMOModel.
	anchoringOn ifNil: [ anchoringOn := model anchor ]
]

{ #category : #'as yet unclassified' }
MOModelWriter >> packageReferenceNamed: aString [

	^ self builder packageReferenceBuilder
		  packageName: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelWriter >> parametrizedTypeReferenceFullyNamed: aString arguments: aCollection [

	^ builder parametrizedTypeReferenceBuilder
		  fullName: aString;
		  argumentTypeReferences: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOModelWriter >> parametrizedTypeReferenceNamed: aString arguments: aCollection [

	^ builder parametrizedTypeReferenceBuilder
		  name: aString;
		  argumentTypeReferences: aCollection;
		  build
]

{ #category : #writing }
MOModelWriter >> populateAnchor [

	| all |
	entity ifNil: [ ^ self ].

	all := entity isCollection
		       ifTrue: [ entity ]
		       ifFalse: [ { entity } ].

	all do: [ :e | 
		e anchor ifNil: [ e anchor: anchoringOn ].
		self populateAnchorOn: e ]
]

{ #category : #writing }
MOModelWriter >> populateAnchorOn: anEntity [

	| subentity |

	anEntity allContainmentRelations , anEntity allReferenceRelations, anEntity allExpressionRelations  
		do: [ :relation | 
			subentity := relation to.
			subentity parent: anEntity.
			subentity anchor:
				anEntity anchor / (subentity name ifNil: [ relation name ])
				/ (subentity className copyReplaceAll: 'MO' with: '') asCamelCase.
			self populateAnchorOn: subentity ]
]

{ #category : #'as yet unclassified' }
MOModelWriter >> primitiveTypeReferenceNamed: aString [

	^ self builder primitiveTypeReferenceNamed: aString
]

{ #category : #'as yet unclassified' }
MOModelWriter >> questionMarkTypeReference [

	^ self typeReferenceNamed: #?
]

{ #category : #initialization }
MOModelWriter >> setAsParentOf: aMOImport [ 

]

{ #category : #initialization }
MOModelWriter >> setCopyEntity: aMOVariableReference [

	entity := aMOVariableReference.
	^ entity
]

{ #category : #'as yet unclassified' }
MOModelWriter >> shallowCopy: aMOBlock [

	^ self builder shallowCopy: aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelWriter >> stringLiteral: aString [

	^ self builder stringLiteralBuilder
		  value: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelWriter >> typeReferenceFullNamed: aString [ 
	 self halt .
]

{ #category : #writing }
MOModelWriter >> typeReferenceNamed: aString [ 
	 self halt .
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateAccessor: aMOAccessor with: aFullBlockClosure [ 
^ self
		  write: aFullBlockClosure
		  forUpdating: aMOAccessor
		  withWriter: MOAccessorWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateAssignment: aMOAssignment with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOAssignment
		  withWriter: self
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateAttribute: aMOAttribute with: aFullBlockClosure [ 
	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOAttribute
		  withWriter: MOAttributeWriter  new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateBlock: aMOBlock with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOBlock
		  withWriter: MOBlockWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateCase: aMOClass with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOClass
		  withWriter: MOCaseWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateClass: aMOClass with: aFullBlockClosure [ 

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOClass
		  withWriter: MOClassWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateConstant: aMOVariable with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOVariable
		  withWriter: MOConstantWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateEnum: aMOMethod with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOMethod
		  withWriter: MOEnumWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateFunction: aMOMethod with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOMethod
		  withWriter: MOFunctionWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateIfElse: aMOIfElse with: aFullBlockClosure [

	| writer |
	writer := MOIfElseWriter new.
	self
		write: aFullBlockClosure
		forUpdating: aMOIfElse
		withWriter: writer.
	^ writer writeResult
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateMethod: aMOMethod with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOMethod
		  withWriter: MOMethodWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateModule: aMOClass with: aFullBlockClosure [ 

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOClass
		  withWriter: MOModuleWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateParameter: aMOParameter with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOParameter
		  withWriter: MOParameterWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateProcedure: aMOMethod with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOMethod
		  withWriter: MOSubProcedureWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateSelect: aMOClass with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOClass
		  withWriter: MOSelectWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateStructure: aMOStructure with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOStructure
		  withWriter: MOStructureWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateVariable: aMOVariable with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOVariable
		  withWriter: MOVariableWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updateWhile: aMOClass with: aFullBlockClosure [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOClass
		  withWriter: MOWhileWriter new
]

{ #category : #'as yet unclassified' }
MOModelWriter >> updaterFor: aDestinationContext with: aProvenanceEntity do: anUpdatingBlock [

	| result |
	result := MOModelUpdateResolver new
		          resolveWriterFor: aProvenanceEntity
		          forUpdating: aDestinationContext
		          writingContext: self
		          do: anUpdatingBlock.
	self populateAnchor.
	^ result
]

{ #category : #statements }
MOModelWriter >> variable: aString typeReference: aMOPrimitiveTypeReference [

	^ self writeStatement: [ :a | 
		  a variable: aString typeReference: aMOPrimitiveTypeReference ]
]

{ #category : #writing }
MOModelWriter >> variableReferenceNamed: aString [

	^ builder variableReferenceBuilder
		  name: aString;
		  build
]

{ #category : #writing }
MOModelWriter >> write: aFullBlockClosure forUpdating: aMOBlock withWriter: writer [

	^ self
		  write: aFullBlockClosure
		  forUpdating: aMOBlock
		  withWriter: writer
		  writerParent: self
]

{ #category : #writing }
MOModelWriter >> write: aFullBlockClosure forUpdating: anEntityToBeModified withWriter: writer writerParent: aWriterParent [

	writer parentWriter: aWriterParent.
	writer builder: self builder.
	writer surface: self.
	writer initializeUpdateBuilderFor: anEntityToBeModified.
	self anchoringOn: anEntityToBeModified anchor.
	writer write: aFullBlockClosure.
	^ entity
]

{ #category : #writing }
MOModelWriter >> write: aBlock withWriter: writer [

	^ self write: aBlock withWriter: writer writerParent: self
]

{ #category : #writing }
MOModelWriter >> write: aBlock withWriter: writer writerParent: aWriterParent [ 

	writer parentWriter: aWriterParent .
	writer builder: self builder.
	writer surface: self.
	writer initializeWriteBuilder.
	writer write: aBlock.
	self populateAnchor.
	^ entity
]

{ #category : #writing }
MOModelWriter >> writeAndAddStatement: aFullBlockClosure [

	^ self writeStatement: aFullBlockClosure
]

{ #category : #writing }
MOModelWriter >> writeBlock: aFullBlockClosure [

	| writer |
	writer := MOBlockWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeClass: aFullBlockClosure [

	| writer |
	writer := MOClassWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeClassType: aFullBlockClosure [

	| writer |
	writer := MOClassTypeWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeCopy: aFullBlockClosure [ 
	
	| writer |
	writer := MOCopyWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeCopyOf: aMOClass [

	| copy |
	copy := model instantiate: aMOClass class.
	aMOClass class allSlots do: [ :a | 
		a write: (a read: aMOClass) to: copy ].
	^ copy
]

{ #category : #writing }
MOModelWriter >> writeDeclarationUnit: aBlock [

	| writer |
	writer := MODeclarationUnitWriter new.
	^ self write: aBlock withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeExpression: aFullBlockClosure [

	| writer |
	writer := MOExpressionWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeFileImport: aFullBlockClosure [

	| writer |
	writer := MOFileImportWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeForm: aFullBlockClosure [ 
| writer |
	writer := MOFormWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeFunction: aFullBlockClosure [ 
	
	| writer |
	writer := MOFunctionWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeImport: aFullBlockClosure [

	| writer |
	writer := MOImportWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeLibrary: aBlock [

	| writer stmt |
	writer := MOLibraryWriter new.
	stmt := self write: aBlock withWriter: writer.
	^ stmt
]

{ #category : #writing }
MOModelWriter >> writeModule: aFullBlockClosure [

	| writer |
	writer := MOModuleWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writePackage: aBlock [

	| writer |
	writer := MOPackageWriter new.
	^ self write: aBlock withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writePackageNamed: aString ifDoesNotExistUsing: aFullBlockClosure [

	^ model packages
		  detect: [ :a | a name = aString ]
		  ifNone: [ self writePackage: aFullBlockClosure ]
]

{ #category : #writing }
MOModelWriter >> writeProject: aBlock [

	| writer stmt |
	writer := MOProjectWriter new.
	stmt := self write: aBlock withWriter: writer.
	^ stmt
]

{ #category : #writing }
MOModelWriter >> writeQuery: aFullBlockClosure [ 
| writer |
	writer := MOQueryWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeReport: aFullBlockClosure [

	| writer |
	writer := MOReportWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeStatement: aBlock [

	| writer stmt |
	writer := MOStatementWriter new.
	stmt := self write: aBlock withWriter: writer.
	^ stmt
]

{ #category : #writing }
MOModelWriter >> writeSubprocedure: aBlock [

	| writer |
	writer := MOSubProcedureWriter new.
	^ self write: aBlock withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeTable: aFullBlockClosure [ 
| writer |
	writer := MOTableWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writeVariable: aFullBlockClosure [

	| writer |
	writer := MOVariableWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]
