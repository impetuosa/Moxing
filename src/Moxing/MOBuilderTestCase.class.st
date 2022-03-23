Class {
	#name : #MOBuilderTestCase,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'Moxing-MicroBuilderTest'
}

{ #category : #running }
MOBuilderTestCase >> assert: newClass isKindOf: aType [

	self assert: (newClass isKindOf: aType)
]

{ #category : #initialization }
MOBuilderTestCase >> setUp [

	super setUp.
	builder := MOModelBuilder new.
	builder model: MOModel new.
	builder model anchor: (MOAnchor on: #/).
	builder language:
		((MOLanguage newFor: builder model) name: 'TestLang') yourself
]
