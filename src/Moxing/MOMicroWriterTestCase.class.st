Class {
	#name : #MOMicroWriterTestCase,
	#superclass : #TestCase,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-MicroWritersTest'
}

{ #category : #initialization }
MOMicroWriterTestCase >> assertAllAnchorsAreSet [

	writer model entities
		select: [ :a | a isKindOf: MOAnchoredDeclaration ]
		thenDo: [ :a | 
			self assert: a anchor isNotNil.
			self deny: a anchor pathIsNotSet ]
	
]

{ #category : #initialization }
MOMicroWriterTestCase >> assertAllParentsAreSet [

	" 
	We only care about Anchored objects in here. 
	PackageReference do not track down parent since they are single instance per model. 
	"
	(writer model entities select: [ :a | a isKindOf: MOAnchoredDeclaration ])
		reject: [ :a | a isKindOf: MOPackageReference ]
		thenDo: [ :a | 
		a anchor isRoot ifFalse: [ self assert: a parent isNotNil ] ]
]

{ #category : #initialization }
MOMicroWriterTestCase >> setUp [
	| builder |
	super setUp.
	builder := MOModelBuilder new.
	builder model: MOModel new.
	builder model anchor: (MOAnchor on: #/).
	builder language:
		((MOLanguage javaFor: builder model) name: 'TestLang') yourself.
	writer := MOModelWriter new. 
	writer model: builder model .
	writer builder: builder.
	
]
