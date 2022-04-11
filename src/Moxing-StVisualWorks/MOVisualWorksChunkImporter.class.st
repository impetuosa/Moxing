Class {
	#name : #MOVisualWorksChunkImporter,
	#superclass : #Object,
	#traits : 'MORBImportingTrait',
	#classTraits : 'MORBImportingTrait classTrait',
	#instVars : [
		'writer',
		'bindings',
		'ringImporter',
		'methodCategory'
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

{ #category : #accessing }
MOVisualWorksChunkImporter >> bindings [
	^ bindings
]

{ #category : #accessing }
MOVisualWorksChunkImporter >> bindings: aCollection [ 
	bindings := aCollection
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

{ #category : #accessing }
MOVisualWorksChunkImporter >> methodCategory [
	^ methodCategory
]

{ #category : #'as yet unclassified' }
MOVisualWorksChunkImporter >> packageBindings: aPackageChunk [

	^ aPackageChunk elements collect: [ :a | a name -> a symbolKind ]
]

{ #category : #parsing }
MOVisualWorksChunkImporter >> parseWithTimeOut: aString [

	| semaphore result process |
	semaphore := Semaphore new.
	process := [ 
	           [ result := StParser parseMethod: aString ]
		           on: Error
		           do: [ :e | result := nil ].
	           semaphore signal ] forkAt:
		           Processor userBackgroundPriority.
	^ semaphore
		  wait: 5 seconds
		  onCompletion: [ 
			  process terminate.
			  result ]
		  onTimeout: [ 
			  process terminate.
			  nil ]
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
  | ast content indexedContent contentLines pragmas |

  content := aMethodChunk contents.
  contentLines := content lines.
  methodCategory := aMethodChunk category. 
  indexedContent := contentLines withIndexCollect: [:a :b |  a -> b ].
  pragmas := indexedContent allButFirst select: [:l |  l key trimBoth beginsWith: '<C:' ].
  pragmas ifNotEmpty: [ pragmas do: [:p |  
		| pc |
              pc := p key trimBoth.
              pc := pc copyFrom: 4 to: pc size - 1.
              contentLines at: p value put: ('<C:''{1}''>' format: {pc}) ].
        content := String lf join: contentLines ].
  [ ast := RBParser parseMethod: content ] on: Exception do: [:e |  self parseWithTimeOut: content ].
  ast ifNil: [ ^nil ].
  ^ast acceptVisitor: self
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