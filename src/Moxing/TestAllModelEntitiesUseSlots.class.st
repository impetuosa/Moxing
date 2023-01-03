Class {
	#name : #TestAllModelEntitiesUseSlots,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'testingClass'
	],
	#category : #'Moxing-Core-Slots'
}

{ #category : #tests }
TestAllModelEntitiesUseSlots >> testAllEntitiesHaveOneParent [

	"' So far we are no expecting multiple parents. '"

	self
		assert:
		(testingClass allSlots select: [ :a | a isKindOf: MOParentSlot ]) size
		equals: 1
]

{ #category : #tests }
TestAllModelEntitiesUseSlots >> testAllEntitiesUseMoSlots [


	self
		assert: (testingClass slots allSatisfy: #isMOSlot)
		description: ' All instance variables must be MOSlot kind '
]

{ #category : #tests }
TestAllModelEntitiesUseSlots >> testMaximum1CandidateRelation [

	self
		assert:
			(testingClass allSlots select: [ :a | a isKindOf: MORefereeSlot ])
				size <= 1
		description: ' So far we do not accept more than one candidate '
]

{ #category : #accessing }
TestAllModelEntitiesUseSlots >> testingClass: aClass [ 
	testingClass := aClass
]
