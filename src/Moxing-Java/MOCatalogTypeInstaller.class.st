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
	packageReference := aMOClassType packageReference.
	packageReference ifNil: [ ^ {  } ].
	^ (aMOModel typesNamed: aMOClassType name) select: [ :t | 
		  t packageReference isNotNil and: [ t packageReference name = packageReference name ] ]
]

{ #category : #'as yet unclassified' }
MOCatalogTypeInstaller >> install: aMOInterface into: aMOModel [

	model := aMOModel.
	^ (self getType: aMOInterface from: aMOModel)
		  ifEmpty: [ 
			  writer := aMOModel writer.
			  aMOInterface parent acceptVisitor: self.
			  writer entity types detect: [ :a | a name = aMOInterface name ] ]
		  ifNotEmpty: [ :t | t anyOne ]
]

{ #category : #evaluating }
MOCatalogTypeInstaller >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
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
			  self visitCollection: aMOAttribute allContainments ] ]
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
		  class name: aMOClass name.
		  self use: class during: [ 
			  class packageReference:
				  (aMOClass packageReference acceptVisitor: self).
			  class superclassReference:
				  (aMOClass superclassReference ifNotNil: [ :i | 
					   i acceptVisitor: self ]).
			  class superTypeReferences:
				  (self visitCollection: aMOClass superTypeReferences).
			  self visitCollection: aMOClass allContainments ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitClassType: aMOClassType [

	^ writer writeClassType: [ :class | 
		  class name: aMOClassType name.

		  self use: class during: [ 
			  class packageReference:
				  (aMOClassType packageReference acceptVisitor: self).

			  class superTypeReferences:
				  (self visitCollection: aMOClassType superTypeReferences).
			  self visitCollection: aMOClassType allContainments ] ]
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
			  self visitCollection: aMOConstructor allContainments ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitDeclarationUnit: aMODeclarationUnit [

	^ writer writeDeclarationUnit: [ :unit | 
		  self use: unit during: [ 
			  self visitCollection: aMODeclarationUnit imports.
			  self visitCollection: aMODeclarationUnit types ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitEmptyBlock: aMOEmptyBlock [ 
	
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitImport: aMOImportPackage [
	writer writeImport: [ :i | 
		i importingPackageReference:
			(aMOImportPackage packageReference acceptVisitor: self).
		aMOImportPackage importsAllPackage ifFalse: [ 
			i importingTypeReference:
				(aMOImportPackage typeReference acceptVisitor: self) ] ]
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
			  during: [ self visitCollection: aMOMethod allContainments ] ]
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
			  self visitCollection: aMOParameter allContainments ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitParametrizableClass: aMOParametrizableClass [

	^ writer writeParametrizableClass: [ :class | 
		  class name: aMOParametrizableClass name.
		  self use: class during: [ 
			  class packageReference:
				  (aMOParametrizableClass packageReference acceptVisitor: self).
			  class superclassReference:
				  (aMOParametrizableClass superclassReference ifNotNil: [ :i | 
					   i acceptVisitor: self ]).
			  class superTypeReferences:
				  (self visitCollection:
					   aMOParametrizableClass superTypeReferences).
			  self visitCollection: aMOParametrizableClass allContainments ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitParametrizableClassType: aMOParametrizableClassType [ 

	^ writer writeParametrizableClassType: [ :class | 
		  class name: aMOParametrizableClassType name.

		  self use: class during: [ 
			  class packageReference:
				  (aMOParametrizableClassType packageReference acceptVisitor: self).

			  class superTypeReferences:
				  (self visitCollection: aMOParametrizableClassType superTypeReferences).
			  self visitCollection: aMOParametrizableClassType allContainments ] ]
]

{ #category : #visiting }
MOCatalogTypeInstaller >> visitParametrizableMethod: aMOParametrizableMethod [ 

	^ writer writeParametrizableMethod:  [ :method | 
		  method selector: aMOParametrizableMethod selector.
		  method returnTypeReference:
			  (aMOParametrizableMethod returnTypeReference acceptVisitor: self).
		  method modifiers: aMOParametrizableMethod modifiers copy.
		  method visibility: aMOParametrizableMethod visibility copy.
		  method thrownTypeReferences:
			  (self visitCollection: aMOParametrizableMethod thrownTypeReferences).

		  self
			  use: method
			  during: [ self visitCollection: aMOParametrizableMethod allContainments ] ]
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
			(self visitCollection: aMOTypeParameter superTypeReferences) ]
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

{ #category : #visiting }
MOCatalogTypeInstaller >> visitVarArgParameter: aMOVariableArgumentsParameter [

	^ writer writeParameter: [ :parameter | 
		  parameter mapsToVariableArguments.
		  parameter name: aMOVariableArgumentsParameter name.
		  parameter typeReference:
			  (aMOVariableArgumentsParameter typeReference acceptVisitor: self).
		  self
			  use: parameter
			  during: [ 
			  self visitCollection:
				  aMOVariableArgumentsParameter allContainments ] ]
]
