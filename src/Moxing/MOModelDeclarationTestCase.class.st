Class {
	#name : #MOModelDeclarationTestCase,
	#superclass : #MOMicroWriterTestCase,
	#category : #'Moxing-MicroWritersTest'
}

{ #category : #types }
MOModelDeclarationTestCase >> testDeclareClass [

	| class |
	class := writer writeClass: [ :cls | 
		         cls name: #ClzzName.
		         cls writeAttribute: [ :atr | 
			         atr
				         name: #id;
				         typeReference: (atr typeReferenceNamed: #int) ].
		         cls writeSubprocedure: [ :subp | subp selector: #subp ] ].
	self assert: class name equals: #ClzzName.
	self assert: class superclassReference isNil.
	self assert: class methods size equals: 1.
	self assert: class attributes size equals: 1.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #types }
MOModelDeclarationTestCase >> testDeclareClassInPackage [

	| class package |
	" ClzzName L <T implements Object> "
	package := writer writePackage: [ :pack | 
		           pack name: 'Test'.
		           pack writeParametrizableClass: [ :cls | 
			           cls name: #ClzzName.
			           cls writeTypeParameter: [ :tp | 
				           tp name: #T.
				           tp addSuperTypeReference:
					           (tp typeReferenceNamed: #Object) ].

			           cls writeSubprocedure: [ :subp | subp selector: #subp ] ] ].
	class := package allTypes first.

	self assert: class parent equals: package.
	self assert: class packageReference candidate equals: package.
	self assert: class name equals: #ClzzName.
	self assert: class typeParameters size equals: 1.
	self
		assert: class typeParameters first superTypeReferences size
		equals: 1.
	self assert: class methods size equals: 1.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #types }
MOModelDeclarationTestCase >> testDeclareClassWithImports [

	| class package |
	" ClzzName L <T implements Object> "
	package := writer writePackage: [ :pack | 
		           pack name: 'Test'.
		           pack writeDeclarationUnit: [ :unit | 
			           unit writeImport: [ :import | 
				           import importTypeName: 'MyType'.
				           import packageName: 'example.com' ].
			           unit writeParametrizableClass: [ :cls | 
				           cls name: #ClzzName.
				           cls writeTypeParameter: [ :tp | 
					           tp name: #T.
					           tp addSuperTypeReference:
						           (tp typeReferenceNamed: #Object) ].

				           cls writeSubprocedure: [ :subp | subp selector: #subp ] ] ] ].
	class := package allTypes first.
	self assert: class name equals: #ClzzName.
	self assert: class typeParameters size equals: 1.
	self
		assert: class typeParameters first superTypeReferences size
		equals: 1.
	self assert: class methods size equals: 1.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #types }
MOModelDeclarationTestCase >> testDeclareClassWithSuperTypes [

	| class |
	" ClzzName L implements Object, Int "
	class := writer writeClass: [ :cls | 
		         cls name: #ClzzName.
		         cls addSuperTypeReference:
			         (cls typeReferenceNamed: #Object).
		         cls addSuperTypeReference:
			         (cls typeReferenceNamed: #Int).
		         cls writeSubprocedure: [ :subp | subp selector: #subp ] ].
	self assert: class name equals: #ClzzName.
	self assert: class superTypeReferences size equals: 2.
	self assert: class methods size equals: 1.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #types }
MOModelDeclarationTestCase >> testDeclareClassWithSuperclass [

	| class |
	" ClzzName L extends Object "
	class := writer writeClass: [ :cls | 
		         cls name: #ClzzName.
		         cls superclassReference:
			         (cls typeReferenceNamed: #Object).
		         cls writeSubprocedure: [ :subp | subp selector: #subp ] ].
	self assert: class name equals: #ClzzName.
	self assert: class superclassReference name equals: #Object.
	self assert: class methods size equals: 1.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #types }
MOModelDeclarationTestCase >> testDeclareClassWithTypeParameters [

	| class |
	" ClzzName L <T implements Object> "
	class := writer writeParametrizableClass: [ :cls | 
		         cls name: #ClzzName.
		         cls writeTypeParameter: [ :tp | 
			         tp name: #T.
			         tp addSuperTypeReference:
				         (tp typeReferenceNamed: #Object) ].

		         cls writeSubprocedure: [ :subp | subp selector: #subp ] ].
	self assert: class name equals: #ClzzName.
	self assert: class typeParameters size equals: 1.
	self
		assert: class typeParameters first superTypeReferences size
		equals: 1.
	self assert: class methods size equals: 1.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #behaviour }
MOModelDeclarationTestCase >> testDeclareFunction [

	| fn |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #void).
		      function writeBlock: [ :block |  ] ].

	self assert: fn block parent equals: fn.
	self assert: (fn isKindOf: MOFunction).
	self assert: fn block statements isEmpty.
	self assert: fn parameters isEmpty.
	self assert: fn returnTypeReference name equals: #void.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #behaviour }
MOModelDeclarationTestCase >> testDeclareFunctionWithParameters [

	| fn |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #void).
		      function writeParameter: [ :p | 
			      p name: #param.
			      p typeReference: (p typeReferenceNamed: #int) ].
		      function writeBlock: [ :block |  ] ].
	self assert: fn block parent equals: fn.
	self assert: (fn isKindOf: MOFunction).
	self assert: fn block statements isEmpty.
	self assert: fn parameters size equals: 1.
	self assert: fn parameters first name equals: #param.
	self assert: fn parameters first parent equals: fn.
	self assert: fn returnTypeReference name equals: #void.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #types }
MOModelDeclarationTestCase >> testDeclareModule [

	| module |
	module := writer writeModule: [ :mod | 
		          mod name: #Module.
		          mod writeSubprocedure: [ :subp | subp selector: #subp ] ].
	self assert: module name equals: #Module.
	self assert: module invocables size equals: 1.
	self assert: module invocables first parent equals: module.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #behaviour }
MOModelDeclarationTestCase >> testDeclareSubProcedure [

	| pro |
	pro := writer writeSubprocedure: [ :procedure | 
		       procedure selector: #hello.
		       procedure writeBlock: [ :block |  ] ].
	self assert: (pro isKindOf: MOProcedure).
	self assert: pro block parent equals: pro.
	self assert: pro block statements isEmpty.
	self assert: pro parameters isEmpty.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #behaviour }
MOModelDeclarationTestCase >> testDeclareSubProcedureWithParameters [

	| pro |
	pro := writer writeSubprocedure: [ :procedure | 
		       procedure selector: #hello.
		       procedure writeParameter: [ :p | 
			       p name: #param.
			       p typeReference: (p typeReferenceNamed: #int) ].
		       procedure writeBlock: [ :block |  ] ].
	self assert: (pro isKindOf: MOProcedure).
	self assert: pro block parent equals: pro.
	self assert: pro block statements isEmpty.
	self assert: pro parameters size equals: 1.
	self assert: pro parameters first parent equals: pro.
	self assert: pro parameters first name equals: #param.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]
