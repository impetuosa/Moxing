Class {
	#name : #MOModelBuilderTestCase,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #Moxing
}

{ #category : #running }
MOModelBuilderTestCase >> assert: newClass isKindOf: aType [

	self assert: (newClass isKindOf: aType)
]

{ #category : #running }
MOModelBuilderTestCase >> setUp [

	super setUp.
	builder := MOModelBuilder new.
	builder language:
		((MOLanguage newFor: builder model) name: 'TestLang') yourself
]

{ #category : #running }
MOModelBuilderTestCase >> testNewClassGetsYouAClass [

	self assert: builder newClass isKindOf: MOClass.
]

{ #category : #running }
MOModelBuilderTestCase >> testNewImportGetsyouAnImport [

	self
		assert: (builder newImportType: #MyClass fromAnchor: 
				 (MOAnchor on: #/) / #package / #org / #package / #bla / #type
				 / #MyClass)
		isKindOf: MOImport
]

{ #category : #running }
MOModelBuilderTestCase >> testNewImportRefersToAType [
	
]

{ #category : #running }
MOModelBuilderTestCase >> testNewImportRefersToManyTypes [
	
]

{ #category : #running }
MOModelBuilderTestCase >> testNewInvocationRefersToAFunction [
]

{ #category : #running }
MOModelBuilderTestCase >> testNewMethodGetsYouAMethod [
	
]

{ #category : #running }
MOModelBuilderTestCase >> testNewMethodGetsYouAMethodWithReferenceForReturn [
]

{ #category : #running }
MOModelBuilderTestCase >> testNewMethodGetsYouAMethodWithReferenceForReturnAndPArameters [
]

{ #category : #running }
MOModelBuilderTestCase >> testNewMethodInvocationRefersToAReceiverAndMethod [
]

{ #category : #running }
MOModelBuilderTestCase >> testNewOperationGetsYouAnOperation [ 

]

{ #category : #running }
MOModelBuilderTestCase >> testNewPackageGetsYouAPackage [
	self assert: (builder newPackageNamed: #name) isKindOf: MOPackage
]

{ #category : #running }
MOModelBuilderTestCase >> testNewSubPackage [

	| pack parent |
	parent := builder newPackageNamed: #name.
	pack := builder newPackageNamed: #pack withParent: parent.

	self assert: pack isKindOf: MOPackage.
	self assert: pack parent isKindOf: MOPackageReference.
	self assert: pack parent candidate equals: parent.
	self assert: (parent subpackages includes: pack)
]

{ #category : #running }
MOModelBuilderTestCase >> testVariablePointsToReferenceType [
]

{ #category : #running }
MOModelBuilderTestCase >> testVariableReferenceRefersToAVariable [
]
