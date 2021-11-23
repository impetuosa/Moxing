Class {
	#name : #MOFunctionOrProcedureBrush,
	#superclass : #MOCompositeBrush,
	#instVars : [
		'entity',
		'writer'
	],
	#category : #'Moxing-Brushes'
}

{ #category : #'as yet unclassified' }
MOFunctionOrProcedureBrush class >> writesInvocableBehaviour [
	^ true
]

{ #category : #'as yet unclassified' }
MOFunctionOrProcedureBrush >> applyTransformationsIfAnyOn: aMOJavaModelWriter [

	policyTransformationMapping ifNotEmpty: [ 
		MOTransformationApplier newFuctionOrProcedureLevelApplication
			transformations: policyTransformationMapping;
			writer: aMOJavaModelWriter;
			transform: entity ]
]

{ #category : #visiting }
MOFunctionOrProcedureBrush >> visitMethod: aMOMethod [

	| class |
	entity ifNotNil: [ self halt ].
	self halt. 
	class := (aMOMethod type isNil or: [ aMOMethod type isVoid ])
		         ifTrue: [ MOProcedure ]
		         ifFalse: [ MOFunction ].

	entity := writer instantiate: class forReplacing: aMOMethod.
	entity visibility: aMOMethod visibility copy.
	entity parameters: (aMOMethod parameters collect: [ :p | p copy ]).
	entity selector: aMOMethod selector copy.
	entity modifiers: (aMOMethod modifiers collect: [ :p | p copy ]).
	(aMOMethod type isNil or: [ aMOMethod type isVoid ]) ifFalse: [ 
		entity type: aMOMethod type copy ].
	entity block: aMOMethod block copy.
	
]

{ #category : #writing }
MOFunctionOrProcedureBrush >> write: aMOMethod into: aMOMicrosoftAccessModelWriter [

	entity := nil.
	writer := aMOMicrosoftAccessModelWriter.
	aMOMethod acceptVisitor: self.
	writer writeInvocable: entity.
	self applyTransformationsIfAnyOn: aMOMicrosoftAccessModelWriter.




	^ entity
]
