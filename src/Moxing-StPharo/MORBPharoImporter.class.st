Class {
	#name : #MORBPharoImporter,
	#superclass : #Object,
	#traits : 'MORBImportingTrait',
	#classTraits : 'MORBImportingTrait classTrait',
	#instVars : [
		'importingPackages',
		'writer',
		'extending',
		'bindings'
	],
	#classInstVars : [
		'siren'
	],
	#category : #'Moxing-StPharo-importing'
}

{ #category : #accessing }
MORBPharoImporter class >> importPharoSiren [

	| phary |
	siren := MOModel newPharo.
	siren name: #phiren. 
	phary := MORBPharoImporter new.
	phary writer: siren writer.
	phary importPackages:
		({ 'Kernel-Objects'. 'Kernel-Numbers'. 'Kernel-Chronology'.
		 'Kernel-Exceptions'. #'Collections-Abstract'.
		 'Collections-Sequenceable'. 'Collections-Unordered'.
		 'Collections-Strings'. 'FFI-Kernel'. 'UnifiedFFI'. #'FileSystem-Core'. #'Colors-Base'. 
		 #Siren } collect: #asPackageOrTag)
]

{ #category : #accessing }
MORBPharoImporter class >> loadExtraPackageIntoSiren: aPackageName [

	| phary |
	phary := MORBPharoImporter new.
	phary writer: siren writer.
	phary importPackages: ({ aPackageName } collect: #asPackageOrTag)
]

{ #category : #accessing }
MORBPharoImporter class >> siren [
	^ siren ifNil: [ self importPharoSiren ]
]

{ #category : #accessing }
MORBPharoImporter class >> siren: aModel [
	 siren := aModel 
]

{ #category : #accessing }
MORBPharoImporter >> bindings [

	^ bindings ifNil: [ bindings := Dictionary new ]
]

{ #category : #accessing }
MORBPharoImporter >> bindings: aCollection [ 
	bindings := aCollection
]

{ #category : #'as yet unclassified' }
MORBPharoImporter >> importPackages: aCollection [

	self visitCollection: aCollection.
	self linkTypes.
]

{ #category : #'as yet unclassified' }
MORBPharoImporter >> linkTypes [

	| model |
	model := writer model.
	(model typeReferences select: [ :a | 
		 a isUnknown not and: [ a candidate isNil ] ]) do: [ :ref | 
		[ ref candidate: (model typeNamed: ref name) ]
			on: Error
			do: [  ] ]
]

{ #category : #utilities }
MORBPharoImporter >> methodCategory [
	 ^ ''
]

{ #category : #visiting }
MORBPharoImporter >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]

{ #category : #visiting }
MORBPharoImporter >> visitArrayNode: aRBArrayNode [

	^ writer stArrayExpression: [ :exp | 
		  self
			  use: exp
			  during: [ self visitCollection: aRBArrayNode statements ] ]
]

{ #category : #visiting }
MORBPharoImporter >> visitCollection: aCollection [

	^ aCollection collect: [ :element | element acceptVisitor: self ]
]

{ #category : #visiting }
MORBPharoImporter >> visitRBClass: aRBClass [

	| metaclass |
	self assert: extending not.
	metaclass := RBMetaclass existingNamed: aRBClass name.

	^ writer writeStClass: [ :class | 
		  class comment: aRBClass comment.
		  class name: aRBClass name.
		  class category: aRBClass category.
		  aRBClass realClass superclass ifNotNil: [ 
			  class superclassReference:
				  (class typeReferenceNamed: aRBClass realClass superclass name) ].

		  aRBClass instanceVariableNames do: [ :iv | 
			  class writeAttribute: [ :a | a name: iv ] ].
		  aRBClass classVariableNames do: [ :cvn | 
			  class writeClassVariable: [ :cv | cv name: cvn ] ].
		  aRBClass sharedPoolNames do: [ :cvn | 
			  class sharedPoolReferenceNamed: cvn ].

		  self use: class during: [ 
			  self visitCollection:
				  (aRBClass realClass methods collect: [ :m | 
					   RBMethod for: aRBClass fromMethod: m andSelector: m selector ]) ].

		  class writeMetaclass: [ :meta | 
			  meta name: metaclass realClass name.
			  metaclass instanceVariableNames do: [ :iv | 
				  meta writeAttribute: [ :a | a name: iv ] ].
			  self use: meta during: [ 
				  self visitCollection:
					  (metaclass realClass methods collect: [ :m | 
						   RBMethod for: metaclass fromMethod: m andSelector: m selector ]) ] ] ]
]

{ #category : #visiting }
MORBPharoImporter >> visitRBMethod: aRBMethod [

	^ aRBMethod ast acceptVisitor: self
]

{ #category : #visiting }
MORBPharoImporter >> visitRPackage: aRPackage [

	^ writer writePackage: [ :pack | 
		  pack name: aRPackage name.
		  self use: pack during: [ 
			  extending := false.
			  self visitCollection: (aRPackage definedClasses collect: [ :a | 
					   RBClass existingNamed: a name ])
			  "  extending := true.
			  self visitCollection:
				  (aRPackage extendedClasses collect: [ :a | 
					   RBClass existingNamed: a name ]) " ] ]
]

{ #category : #visiting }
MORBPharoImporter >> visitRPackageTag: aRPackageTag [

	^ writer writePackage: [ :pack | 
		  pack name: aRPackageTag package name , '-' , aRPackageTag name.
		  self use: pack during: [ 
			  extending := false.
			  self visitCollection:
				  (aRPackageTag definedClasses collect: [ :a | 
					   RBClass existingNamed: a name ]).
			  extending := true.
			  self visitCollection:
				  (aRPackageTag extendedClasses collect: [ :a | 
					   RBClass existingNamed: a name ]) ] ]
]

{ #category : #accessing }
MORBPharoImporter >> writer [
	^ writer
]

{ #category : #accessing }
MORBPharoImporter >> writer: aMOModelWriter [ 
	writer := aMOModelWriter
]
