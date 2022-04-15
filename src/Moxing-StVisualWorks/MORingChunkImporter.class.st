Class {
	#name : #MORingChunkImporter,
	#superclass : #RingChunkImporter,
	#instVars : [
		'writer',
		'elements'
	],
	#category : #'Moxing-StVisualWorks-chunk importer'
}

{ #category : #accessing }
MORingChunkImporter >> allElements [

	^ elements
	  ,
		  ((elements select: [ :a | a isKindOf: PackageChunk ]) 
			   flatCollect: #elements)
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> classDefinition: aString parsed: aRBMessageNode with: aDoItChunk [

	writer writeStClass: [ :class | 
		class name: aRBMessageNode arguments first value.

		class superclassReference: (class typeReferenceNamed:
				 (self fetchArgument: #superclass from: aRBMessageNode)).


		(' ' split:
			 (self fetchArgument: #instanceVariableNames from: aRBMessageNode)
				 trimBoth) do: [ :a | 
			class writeAttribute: [ :att | att name: a ] ].
		(' ' split:
			 (self
				  fetchArgument: #classInstanceVariableNames
				  from: aRBMessageNode) trimBoth) do: [ :a | 
			class writeAttribute: [ :att | 
				att name: a.
				att setStaticBinding ] ] ]
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> createBehaviourForExtension: aString [

	| class |

	class := ClassChunk new.
	class name: aString.
	class isPreexisting: true.
	^ class
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> createPreexistingPackage: aString [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> createPreexistingPackage: aString into: aPackageChunk [

	| element |

	element := PackageChunk new
		           name: aString;
		           isPreexisting: true;
		           kind: #package;
		           yourself.
	aPackageChunk elements add: element.
	^ element
]

{ #category : #accessing }
MORingChunkImporter >> elements [

	^ elements ifNil: [ elements := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> fetchArgument: aString from: aRBMessageNode [

	^ (aRBMessageNode arguments at:
		   ((':' split: aRBMessageNode selector) indexOf: aString)) value
]

{ #category : #reading }
MORingChunkImporter >> fileInFrom: aStream [

	| changes |

	changes := (MOCodeImporter readStream: aStream) parseChunks.

	changes do: [ :change | change accept: self ].
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> findElement: aString [

	| parts |
	parts := '.' split: aString.
	parts := parts size = 1
		         ifTrue: [ 
			         { 
				         #Smalltalk.
				         parts first } ]
		         ifFalse: [ parts ].
	^ (elements detect: [ :a | 
		   a kind = #package and: [ a name = parts first ] ]) elements 
		  detect: [ :a | a name = parts second ]
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> findPackage: aString [

	| parts |
	parts := '.' split: aString.
	^ parts inject: self into: [ :pack :each | 
		  pack elements
			  detect: [ :element | 
			  element kind = #package and: [ element name = each ] ]
			  ifNone: [ self createPreexistingPackage: each into: pack ] ]
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> findPackage: aPackageName andBehaviourOrCreateForExtension: aBehaviourName [

	| pack |
	pack := self findPackage: (aPackageName ifNil: [ #Smalltalk ]).

	^ pack elements detect: [ :a | a name = aBehaviourName ] ifNone: [ 
		  | b |
		  b := self createBehaviourForExtension: aBehaviourName.
		  pack elements add: b.
		  b ]
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> into: aString comment: aComment node: aRBMessageNode [

	| element |
	element := self findElement: aString.
	element comment: aComment.
	element addNode: aRBMessageNode.
	^ element
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> into: aString create: aKindOfElement named: aName node: aRBMessageNode [

	| entity |
	self assert: aString = #CodeComponent.
	self assert: aKindOfElement = #package.

	self assert: aName ~= #Smalltalk.


	entity := PackageChunk new
		          name: aName;
		          kind: aKindOfElement;
		          addNode: aRBMessageNode;
		          packageName: #Smalltalk yourself.

	self smalltalkPackage add: entity.

	self elements add: entity.
	^ entity
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> into: aString defineClass: aClassName superclass: aSuperclassName indexedType: anIndexedType private: aBoolean instanceVariableNames: instanceVars classInstanceVariableNames: classVars imports: importString category: category attributes: someAttributes node: aRBMessageNode [

	| class |
	class := self
		         into: aString
		         defineClass: aClassName
		         superclass: aSuperclassName
		         indexedType: anIndexedType
		         private: aBoolean
		         instanceVariableNames: instanceVars
		         classInstanceVariableNames: classVars
		         imports: importString
		         category: category
		         node: aRBMessageNode.
	class state at: #attributes put: someAttributes.
	^ class
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> into: aString defineClass: aClassName superclass: aSuperclassName indexedType: anIndexedType private: aBoolean instanceVariableNames: instanceVars classInstanceVariableNames: classVars imports: importString category: category node: aRBMessageNode [

	| element |
	element := ClassChunk new.
	element kind: #class.
	element name: aClassName.
	element state at: #superclass put: aSuperclassName.
	element state at: #indexedType put: anIndexedType.
	element state at: #private put: aBoolean.
	element state at: #instanceVariables put: instanceVars.
	element state at: #classInstanceVariables put: classVars.
	element state at: #importString put: importString.
	element state at: #category put: category.
	element addNode: aRBMessageNode.



	element state at: #packageName put: aString.
	(self findPackage: aString) add: element.
	^ element
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> into: aPackage defineNameSpace: aString private: aBoolean imports: anImportingString category: aCategory node: aRBMessageNode [

	| element |
	self assert: aPackage = #Smalltalk.
	element := MessageSendBasedChunk new.
	element kind: #namespace.
	element name: aString.
	element state at: #private put: aBoolean.
	element state at: #imports put: anImportingString.
	element state at: #category put: aCategory.
	element addNode: aRBMessageNode.
	^ element
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> into: aString defineSharedVariable: aVariableName private: aBoolean constant: aConstant category: aCategory initializer: anInitializer node: aRBMessageNode [

	| pk element |
	pk := self findElement: aString.
	element := SharedVariableChunk new.
	pk addSharedVariable: element.
	element name: aVariableName.
	element state at: #private put: aBoolean.
	element state at: #isConstant put: aConstant.
	element state at: #category put: aCategory.
	element state at: #initializer put: anInitializer.
	element state at: #private put: aBoolean.
	element addNode: aRBMessageNode.

	^ element
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> into: aString type: aKindOfElement named: aName property: aPropertyName value: aCollection node: aRBMessageNode [

	| element |
	self assert: aString = #CodeComponent.
	self assert: aKindOfElement = #package.
	element := self elements detect: [ :a | 
		           a kind = aKindOfElement and: [ a name = aName ] ].
	element state at: aPropertyName asSymbol put: aCollection.
	element addNode: aRBMessageNode.
	^ element
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> messageSendBased: aString parsed: aRBMessageNode with: aDoItChunk [

	| selector args |
	aRBMessageNode receiver isLiteralNode
		ifTrue: [ 
		aRBMessageNode selector = #initialize ifFalse: [ self halt ] ]
		ifFalse: [ 
			args := OrderedCollection new.
			args add: aRBMessageNode receiver name.
			selector := #into: , aRBMessageNode selector uncapitalized , #node:.
			selector := selector copyReplaceAll: '.' with: '_'.
			args addAll: (aRBMessageNode arguments collect: #value).
			args add: aRBMessageNode.
			(self perform: selector asSymbol withArguments: args asArray) 
				contents: aString ]
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> msgClassComment: aString parsed: aRBMessageNode with: aDoItChunk [ 
	
]

{ #category : #reading }
MORingChunkImporter >> msgClassComment: string with: chgRec [

	| tokens theClass |

	tokens := self scannedSource: string.
	
	(tokens size >= 3
		and:[ tokens last isString ])
	ifTrue:[
		theClass := self classNamed: tokens first.
		((tokens at: (tokens size - 1)) == #class
		ifTrue: [ theClass classSide ]
		ifFalse:[ theClass ]) comment: tokens last asString ]
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> name: aString smalltalkDefineClass: aClassName superclass: aSuperclassName indexedType: anIndexedType private: aBoolean instanceVariableNames: instanceVars classInstanceVariableNames: classVars imports: importString category: category node: aRBMessageNode [

	| element |
	element := MessageSendBasedChunk new.
	element kind: #class.
	element name: aClassName.
	element state at: #packageName put: aString.
	element state at: #superclass put: aSuperclassName.
	element state at: #indexedType put: anIndexedType.
	element state at: #private put: aBoolean.
	element state at: #instanceVariables put: instanceVars.
	element state at: #classInstanceVariables put: classVars.
	element state at: #importString put: importString.
	element state at: #category put: category.
	element addNode: aRBMessageNode.
	^ element
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> smalltalkDefineClass: aClassName superclass: aSuperclassName indexedType: anIndexedType private: aBoolean instanceVariableNames: instanceVars classInstanceVariableNames: classVars imports: importString category: category node: aRBMessageNode [

	^ self
		  into: #Smalltalk
		  defineClass: aClassName
		  superclass: aSuperclassName
		  indexedType: anIndexedType
		  private: aBoolean
		  instanceVariableNames: instanceVars
		  classInstanceVariableNames: classVars
		  imports: importString
		  category: category
		  node: aRBMessageNode
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> smalltalkDefineNameSpace: aString private: aBoolean imports: anImportingString category: aCategory node: aRBMessageNode [

	| element |
	element := MessageSendBasedChunk new.
	element kind: #namespace.
	element name: aString.
	element state at: #private put: aBoolean.
	element state at: #imports put: anImportingString.
	element state at: #category put: aCategory.
	element addNode: aRBMessageNode.
	^ element
]

{ #category : #'as yet unclassified' }
MORingChunkImporter >> smalltalkPackage [

	| entity |
	^ self elements
		  detect: [ :a | a kind = #package and: [ a name = #Smalltalk ] ]
		  ifNone: [ 
			  entity := PackageChunk new
				            name: #Smalltalk;
				            kind: #package;
				            addNode: 'none'.

			  self elements add: entity.
			  entity ]
]

{ #category : #reading }
MORingChunkImporter >> visitDoItChunk: aChunk [

	| contents parsed |
	super visitDoItChunk: aChunk.
	contents := aChunk contents.
	parsed := StParser parseExpression: contents.

	parsed isMessage ifTrue: [ 
		self messageSendBased: contents parsed: parsed with: aChunk ]
]

{ #category : #reading }
MORingChunkImporter >> visitMethodChunk: aChunk [

	| behaviour |
	super visitMethodChunk: aChunk.
	behaviour := self
		             findPackage: (aChunk packageName ifNil: [ #Smalltalk ])
		             andBehaviourOrCreateForExtension: aChunk behaviorName.


	behaviour addMethodChunk: aChunk
]

{ #category : #accessing }
MORingChunkImporter >> writer: aMOModelWriter [

	writer := aMOModelWriter
]
