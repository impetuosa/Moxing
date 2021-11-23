Class {
	#name : #MOJavaMooseBasedLoader,
	#superclass : #Object,
	#instVars : [
		'workingDirectory',
		'mooseModel',
		'model',
		'stack',
		'mapping',
		'contextStack'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #loading }
MOJavaMooseBasedLoader >> initialize [

	super initialize.
	
	stack := Stack new.
	mapping := Dictionary new.
	contextStack := Stack new
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> instantiate: aClass for: aSource [

	| instance |
	instance := aClass newForJavaIn: model.
	mapping at: aSource put: instance.
	^ instance
]

{ #category : #'as yet unclassified' }
MOJavaMooseBasedLoader >> loadCatalog [

	self assert: (workingDirectory / 'pom.xml') exists.
	model catalog: (MOJavaTarCatalogLoader new
			 pom: workingDirectory / 'pom.xml';
			 load)
]

{ #category : #loading }
MOJavaMooseBasedLoader >> loadNamed: aName [

	model := MOModel new.
	model name: aName.
	model anchor: (MOAnchor on: #/) / aName.
	mooseModel accept: self.
	self loadCatalog.
	^ model
]

{ #category : #accessing }
MOJavaMooseBasedLoader >> model [
	^ model
]

{ #category : #accessing }
MOJavaMooseBasedLoader >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #accessing }
MOJavaMooseBasedLoader >> mooseModel: aFamixJavaModel [ 
	mooseModel := aFamixJavaModel 
]

{ #category : #initialization }
MOJavaMooseBasedLoader >> push: aValue during: aBlock [
	stack push: aValue.
	aBlock
		ensure: [ stack pop ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> pushContext: aValue during: aBlock [
	contextStack push: aValue.
	^ aBlock
		ensure: [ contextStack pop ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> visitAnnotationType: aFamixJavaAnnotationType [

	| class |
	class := self instantiate: MOAnnotationType for: aFamixJavaAnnotationType.
	class name: aFamixJavaAnnotationType name.
	self withTop: [ :top | 
		top addType: class.
		class anchor: top anchor / #class / class name ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> visitClass: aFamixJavaClass [

	| class |
	class := self instantiate: MOClass for: aFamixJavaClass.
	class name: aFamixJavaClass name.
	self withTop: [ :top | 
		top addType: class.
		class anchor: top anchor / #class / class name ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a accept: self ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> visitMooseModel: aFamixJavaModel [

	| phase2 |
	(aFamixJavaModel allNamespaces select: [ :a | 
		 a parentNamespace isNil ]) do: [ :d | d accept: self ].
	phase2 := MOJavaMooseBasedLoaderPhase2 new.
	phase2 mapping: mapping.
	phase2 model: model.
	aFamixJavaModel accept: phase2
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> visitNamespace: aFamixJavaNamespace [

	| pack |
	pack := self instantiate: MOPackage for: aFamixJavaNamespace.
	pack name: aFamixJavaNamespace name.
	self
		withTop: [ :top | 
			top addPackage: pack.
			pack parent: top .
			pack anchor: top anchor / #packages / pack name.
			]
		ifEmpty: [ 
			pack parent: model .
			pack anchor: model anchor / #packages / pack name.
			" probably the parent is the model  " ].
	self push: pack during: [ 
		self visitCollection: aFamixJavaNamespace childNamespaces.
		self visitCollection: aFamixJavaNamespace types.
		self visitCollection: aFamixJavaNamespace definedAnnotationTypes ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> visitParameterizableClass: aFamixJavaParameterizableClass [ 
	self visitClass: aFamixJavaParameterizableClass 
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> visitParameterizedType: aFamixJavaParameterizedType [

	self visitClass: aFamixJavaParameterizedType
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> withCurrentContext: aBlock [

	^ self withCurrentContext: aBlock ifEmpty: [ self error: 'Stack is empty!' ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> withCurrentContext: aBlock ifEmpty: aanEmptyBlock [

	^ contextStack
		  ifEmpty: aanEmptyBlock
		  ifNotEmpty: [ aBlock value: contextStack top ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> withTop: aBlock [

	^ self withTop: aBlock ifEmpty: [ self error: 'Stack is empty!' ]
]

{ #category : #visiting }
MOJavaMooseBasedLoader >> withTop: aBlock ifEmpty: aanEmptyBlock [

	^ stack ifEmpty: aanEmptyBlock ifNotEmpty: [ aBlock value: stack top ]
]

{ #category : #configuration }
MOJavaMooseBasedLoader >> workingDirectory: aString [

	workingDirectory := aString asFileReference
]