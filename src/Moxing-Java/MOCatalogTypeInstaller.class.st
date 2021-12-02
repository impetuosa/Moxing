Class {
	#name : #MOCatalogTypeInstaller,
	#superclass : #Object,
	#instVars : [
		'writer',
		'model'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOCatalogTypeInstaller >> getType: aMOClassType from: aMOModel [

	| packageReference |
	packageReference := aMOClassType parent.
	packageReference ifNil: [ ^ {  } ].
	^ (aMOModel typesNamed: aMOClassType name) select: [ :t | 
		  t parent isNotNil and: [ t parent name = packageReference name ] ]
]

{ #category : #'as yet unclassified' }
MOCatalogTypeInstaller >> install: aMOInterface into: aMOModel [

	self assert: (aMOInterface isKindOf: MOType).
	model := aMOModel .
	^ (self getType: aMOInterface from: aMOModel)
		  ifEmpty: [ 
			  writer := aMOModel writer.
			  aMOInterface acceptVisitor: self.
			  writer entity ]
		  ifNotEmpty: [ :t | t anyOne ]
]

{ #category : #evaluating }
MOCatalogTypeInstaller >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	aBlock ensure: [ writer := prev ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitArrayTypeReference: aMOArrayTypeReference [

	| params |
	params := aMOArrayTypeReference argumentTypeReferences collect: [ :t | 
		          t acceptVisitor: self ].
	^ writer arrayTypeReferenceOf: params first
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitAttribute: aMOAttribute [

	^ writer writeAttribute: [ :a | 
		  a name: aMOAttribute name.
		  a modifiers: aMOAttribute modifiers copy.
		  a typeReference: (aMOAttribute typeReference acceptVisitor: self).
		  aMOAttribute visibility ifNotNil: [ :v | a visibility: v ].
		  self
			  use: a
			  during: [ 
			  self visitCollection: aMOAttribute hierarchicalChildren ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitBlock: aMOBlock [

	^ writer writeBlock: [ :block | 
		  self
			  use: block
			  during: [ self visitCollection: aMOBlock statements ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitClass: aMOClass [

	^ writer writeClass: [ :class | 
		  class packageReference: (aMOClass parent acceptVisitor: self).
		  class name: aMOClass name.
		  class superclassReference:
			  (aMOClass superclassReference ifNotNil: [ :i | 
				   i acceptVisitor: self ]).
		  class superTypeReferences:
			  (self visitCollection: aMOClass supertypeReferences).
		  self
			  use: class
			  during: [ self visitCollection: aMOClass hierarchicalChildren ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitClassType: aMOClassType [

	^ writer writeClassType: [ :class | 
		  class packageReference: (aMOClassType parent acceptVisitor: self).
		  class name: aMOClassType name.
		  class superTypeReferences:
			  (self visitCollection: aMOClassType supertypeReferences).
		  self
			  use: class
			  during: [ 
			  self visitCollection: aMOClassType hierarchicalChildren ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitConstructor: aMOConstructor [

	^ writer writeConstructor: [ :constructor | 
		  constructor modifiers: aMOConstructor modifiers copy.
		  constructor visibility: aMOConstructor visibility copy.
		  constructor thrownTypeReferences:
			  (self visitCollection: aMOConstructor thrownTypeReferences).

		  self
			  use: constructor
			  during: [ 
			  self visitCollection: aMOConstructor hierarchicalChildren ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitMethod: aMOMethod [

	^ writer writeMethod: [ :method | 
		  method selector: aMOMethod selector.
		  method returnTypeReference:
			  (aMOMethod returnTypeReference acceptVisitor: self).
		  method modifiers: aMOMethod modifiers copy.
		  method visibility: aMOMethod visibility copy.
		  method thrownTypeReferences:
			  (self visitCollection: aMOMethod thrownTypeReferences).

		  self
			  use: method
			  during: [ self visitCollection: aMOMethod hierarchicalChildren ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitPackageDependency: aMOImportPackage [

	writer writeImport: [ :i | 
		i importAllTypesOnPackage: aMOImportPackage typeReference name ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitPackageReference: aMOPackageReference [

	^ (writer packageReferenceNamed: aMOPackageReference name) parent:
		  (aMOPackageReference parent ifNotNil: [ :p | 
			   p acceptVisitor: self ])
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitParameter: aMOParameter [

	^ writer writeParameter: [ :parameter | 
		  parameter name: aMOParameter name.
		  parameter typeReference:
			  (aMOParameter typeReference acceptVisitor: self).
		  self
			  use: parameter
			  during: [ 
			  self visitCollection: aMOParameter hierarchicalChildren ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitParametrizedTypeReference: aMOParametrizedTypeReference [

	| params type ref |
	type := self getType: aMOParametrizedTypeReference from: model.
	params := aMOParametrizedTypeReference argumentTypeReferences 
		          collect: [ :t | t acceptVisitor: self ].
	ref := writer
		       parametrizedTypeReferenceNamed:
		       aMOParametrizedTypeReference name
		       arguments: params.
	type ifNotEmpty: [ ref candidate: type anyOne ].
	^ ref
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	^ writer primitiveTypeReferenceNamed: aMOPrimitiveTypeReference name
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitTypeParameter: aMOTypeParameter [

	writer writeTypeParameter: [ :typeParameter | 
		typeParameter name: aMOTypeParameter name.
		typeParameter superTypeReferences:
			(self visitCollection: aMOTypeParameter supertypeReferences) ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitTypeReference: aMOParametrizedTypeReference [

	| fullName reference type |
	type := self getType: aMOParametrizedTypeReference from: model.

	fullName := aMOParametrizedTypeReference fullName.
	reference := (fullName indexOf: $.) > 0
		             ifTrue: [ 
			             writer typeReferenceFullNamed:
				             aMOParametrizedTypeReference fullName ]
		             ifFalse: [ 
		             writer typeReferenceNamed:
			             aMOParametrizedTypeReference fullName ].
	type ifNotEmpty: [ reference candidate: type anyOne ].
	^ reference
]
