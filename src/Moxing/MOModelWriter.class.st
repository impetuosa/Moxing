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
	entity := aMOClass
]

{ #category : #adding }
MOModelWriter >> addPackage: aMOPackage [

	self assert: (model entities includes: aMOPackage).
	entity := aMOPackage
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
MOModelWriter >> buildExpression: aFullBlockClosure [

	^ (aFullBlockClosure value: builder) build
]

{ #category : #writing }
MOModelWriter >> builder [

	^ builder ifNil: [ 
		  builder := MOModelBuilder new.
		  builder model: model.
		  builder ]
]

{ #category : #accessing }
MOModelWriter >> builder: aMOModelBuilder [ 
	builder := aMOModelBuilder
]

{ #category : #accessing }
MOModelWriter >> model: aMOModel [ 
	model := aMOModel.
	anchoringOn ifNil: [ anchoringOn := model anchor ]
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
MOModelWriter >> writePackage: aBlock [

	| writer |
	writer := MOPackageWriter new.
	^ self write: aBlock withWriter: writer
]
