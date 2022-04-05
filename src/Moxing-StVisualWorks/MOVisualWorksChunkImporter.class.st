Class {
	#name : #MOVisualWorksChunkImporter,
	#superclass : #Object,
	#traits : 'MORBImportingTrait',
	#classTraits : 'MORBImportingTrait classTrait',
	#instVars : [
		'writer',
		'bindings',
		'ringImporter'
	],
	#classInstVars : [
		'siren'
	],
	#category : #'Moxing-StVisualWorks-chunk importer'
}

{ #category : #accessing }
MOVisualWorksChunkImporter class >> siren [
	^ siren
]

{ #category : #'as yet unclassified' }
MOVisualWorksChunkImporter class >> siren: aMOModel [

	siren := aMOModel
]

{ #category : #'as yet unclassified' }
MOVisualWorksChunkImporter >> classBindings: aRGClassDefinition [

	^ OrderedCollection streamContents: [ :all | 
		  all nextPutAll:
			  (aRGClassDefinition instanceVariables collect: [ :c | 
				   c name -> #InstanceVariable ]).
		 " all nextPutAll:
			  (aRGClassDefinition classVariables collect: [ :c | 
				   c name -> #ClassVariable ])."
		  all nextPut: aRGClassDefinition superclass -> #Class.
		  aRGClassDefinition sharedVariables collect: [ :sp | 
			  sp name -> #SharedPoolVariable ] ]
]

{ #category : #'as yet unclassified' }
MOVisualWorksChunkImporter >> importFromChunkImporter: aRingChunkImporter [

	ringImporter := aRingChunkImporter.




	aRingChunkImporter elements do: [ :c | c accept: self ]
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> initialize [

	super initialize.
	bindings := Dictionary new
]

{ #category : #'as yet unclassified' }
MOVisualWorksChunkImporter >> packageBindings: aPackageChunk [

	^ aPackageChunk elements collect: [ :a | a name -> a symbolKind ]
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> visitClassChunk: aClassChunk [

	^ self addBindings: (self classBindings: aClassChunk) during: [ 
		  writer writeStClass: [ :class | 
			  class name: aClassChunk name.
			  class comment: aClassChunk comment.
			  class category: aClassChunk category.
			  aClassChunk packageName ifNotNil: [ 
				  class packageReference:
					  (class packageReferenceNamed: aClassChunk packageName) ].
			  class superclassReference:
				  (class typeReferenceNamed: aClassChunk superclass).
			  aClassChunk instanceVariables do: [ :i | 
				  class writeAttribute: [ :attr | attr name: i name ] ].

			  class writeMetaclass: [ :meta | 
				  meta name: aClassChunk name , ' class'.
				  self use: meta during: [ 
					  aClassChunk classVariables do: [ :i | 
						  meta writeAttribute: [ :attr | attr name: i name ] ].
					  self visitCollection: (aClassChunk methods select: #isMeta) ] ].

			  self use: class during: [ 
				  self visitCollection: (aClassChunk methods reject: #isMeta).
				  self visitCollection: aClassChunk sharedVariables ] ] ]
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> visitClassDefinition: aRGClassDefinition [

	| classChunk |
	classChunk := ringImporter allElements detect: [ :a | 
		              a name = aRGClassDefinition name and: [ 
			              a kind = #class ] ].


	self halt.
	^ self
		  addBindings: (self classBindings: aRGClassDefinition)
		  during: [ 
			  writer writeStClass: [ :class | 
				  class name: aRGClassDefinition name.
				  class sharedPools:
					  (aRGClassDefinition sharedPools collect: [ :sh | 
						   class typeReferenceNamed: sh ]).
				  aRGClassDefinition category ifNotNil: [ 
					  class packageReference:
						  (class packageReferenceNamed: aRGClassDefinition category) ].
				  class superclassReference:
					  (class typeReferenceNamed: aRGClassDefinition superclassName).
				  aRGClassDefinition instanceVariables do: [ :i | 
					  class writeAttribute: [ :attr | attr name: i name ] ].
				  aRGClassDefinition classVariables do: [ :i | 
					  class writeAttribute: [ :attr | 
						  attr setStaticBinding.
						  attr name: i name ] ].

				  self use: class during: [ 
					  self visitCollection: aRGClassDefinition methods.
					  aRGClassDefinition theMetaClass acceptVisitor: self ] ] ]
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> visitMetaclass: aRGMetaclassDefinition [

	^ writer writeMetaclass: [ :metaclass | 
		  metaclass name: aRGMetaclassDefinition name.
		  aRGMetaclassDefinition instanceVariables do: [ :a | 
			  metaclass writeAttribute: [ :attr | attr name: a name ] ].
		  self
			  use: metaclass
			  during: [ self visitCollection: aRGMetaclassDefinition methods ] ]
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> visitMethodChunk: aMethodChunk [

	| ast |
	ast := RBParser parseMethod: aMethodChunk contents onError: [ ^ nil ].
	^ ast acceptVisitor: self
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> visitMethodDefinition: aRGMethodDefinition [

	^ aRGMethodDefinition ast acceptVisitor: self
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> visitPackageChunk: aPackageChunk [

	^ self addBindings: (self packageBindings: aPackageChunk) during: [ 
		  writer writeVisualWorksPackage: [ :pack | 
			  pack name: aPackageChunk name.
			  pack comment: aPackageChunk comment.
			  pack prerequisiteParcels: aPackageChunk prerequisiteParcels.
			  pack parcelName: aPackageChunk parcelName.
			  self use: pack during: [ 
				  self visitCollection: aPackageChunk elements.
				  self visitCollection: aPackageChunk sharedVariables ] ] ]
]

{ #category : #visiting }
MOVisualWorksChunkImporter >> visitSharedVariableChunk: aSharedVariableChunk [

	^ aSharedVariableChunk isConstant
		  ifTrue: [ 
			  writer writeSharedConstant: [ :sharedVar | 
				  sharedVar name: aSharedVariableChunk name.
				  sharedVar isPreexisting: aSharedVariableChunk isPreexisting.
				  sharedVar initializer:
					  (writer literalForValue: aSharedVariableChunk initializer) ] ]
		  ifFalse: [ 
			  writer writeSharedVariable: [ :sharedVar | 
				  sharedVar name: aSharedVariableChunk name.
				  sharedVar isPreexisting: aSharedVariableChunk isPreexisting.
				  sharedVar initializer:
					  (writer literalForValue: aSharedVariableChunk initializer) ] ]
]

{ #category : #'as yet unclassified' }
MOVisualWorksChunkImporter >> writer [
	 ^ writer 
]

{ #category : #accessing }
MOVisualWorksChunkImporter >> writer: aMOModelWriter [ 
	writer := aMOModelWriter
]
