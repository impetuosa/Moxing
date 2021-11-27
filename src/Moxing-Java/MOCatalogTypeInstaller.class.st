Class {
	#name : #MOCatalogTypeInstaller,
	#superclass : #Object,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOCatalogTypeInstaller >> install: aMOInterface into: aMOModel [

	self assert: (aMOInterface isKindOf: MOType).
	writer := aMOModel writer.
	aMOInterface acceptVisitor: self.
	^ writer entity
]

{ #category : #evaluating }
MOCatalogTypeInstaller >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	aBlock ensure: [ writer := prev ]
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
MOCatalogTypeInstaller >> visitPackage: aMOPackage [

	| new |
	aMOPackage parent ifNotNil: [ aMOPackage parent acceptVisitor: self ].
	package
		ifNil: [ 
			package := model rootPackages detect: [ :p | 
				           p name = aMOPackage name ] ]
		ifNotNil: [ 
			package := package subpackages
				           detect: [ :p | p name = aMOPackage name ]
				           ifNone: [ 
					           new := MOPackage newForJavaIn: model.
					           new name: aMOPackage name.
					           package addPackage: new.
					           new anchor: package anchor / #packages / new name.
					           new ] ]
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
MOCatalogTypeInstaller >> visitTypeReference: aMOParametrizedTypeReference [

	| fullName |
	fullName := aMOParametrizedTypeReference fullName.
	^ (fullName indexOf: $.) > 0
		  ifTrue: [ 
			  writer typeReferenceFullNamed:
				  aMOParametrizedTypeReference fullName ]
		  ifFalse: [ 
		  writer typeReferenceNamed: aMOParametrizedTypeReference fullName ]
]
