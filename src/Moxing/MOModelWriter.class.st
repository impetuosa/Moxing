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
MOModelWriter >> addClass: aMOClass [

	self assert: (aMOClass isKindOf: MOClass).
	self assert:
		(model types select: [ :t | t fullName = aMOClass fullName ]) size
		= 1.
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
MOModelWriter >> addImport: aMOImport [

	entity := aMOImport
]

{ #category : #adding }
MOModelWriter >> addPackage: aMOPackage [

	self assert: (model entities includes: aMOPackage).
	entity := aMOPackage
]

{ #category : #adding }
MOModelWriter >> addStatement: aMOMethodInvocation [

	entity := aMOMethodInvocation
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

{ #category : #'as yet unclassified' }
MOModelWriter >> buildExpression: aFullBlockClosure [

	^ (aFullBlockClosure value: builder) build
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

{ #category : #accessing }
MOModelWriter >> entity [
	^ entity
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

{ #category : #'as yet unclassified' }
MOModelWriter >> primitiveTypeReferenceNamed: aString [

	^ builder primitiveTypeReferenceNamed: aString
]

{ #category : #'as yet unclassified' }
MOModelWriter >> questionMarkTypeReference [

	^ self typeReferenceNamed: #?
]

{ #category : #initialization }
MOModelWriter >> setAsParentOf: aMOImport [ 

]

{ #category : #'as yet unclassified' }
MOModelWriter >> typeReferenceFullNamed: aString [

	^ builder typeReferenceBuilder
		  fullName: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelWriter >> typeReferenceNamed: aString [

	^ builder typeReferenceBuilder
		  name: aString;
		  build
]

{ #category : #writing }
MOModelWriter >> variableReferenceNamed: aString [

	^ builder variableReferenceBuilder
		  name: aString;
		  build
]

{ #category : #writing }
MOModelWriter >> write: aBlock withWriter: writer [

	writer builder: self builder.
	writer surface: self.
	writer initializeWriteBuilder.
	writer write: aBlock.
	^ entity
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
MOModelWriter >> writeCopyOf: aMOClass [

	| copy |
	copy := model instantiate: aMOClass class.
	aMOClass class allSlots do: [ :a | 
		a write: (a read: aMOClass) to: copy ].
	^ copy
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
MOModelWriter >> writeMethodInvocation: aFullBlockClosure [

	| writer |
	writer := MOStatementMethodInvocationWriter new.
	^ self write: aFullBlockClosure withWriter: writer
]

{ #category : #writing }
MOModelWriter >> writePackage: aBlock [

	| writer |
	writer := MOPackageWriter new.
	^ self write: aBlock withWriter: writer
]
