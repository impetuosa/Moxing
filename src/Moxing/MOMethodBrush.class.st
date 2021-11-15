Class {
	#name : #MOMethodBrush,
	#superclass : #MOCompositeBrush,
	#instVars : [
		'entity',
		'writer'
	],
	#category : #'Moxing-Brushes'
}

{ #category : #'as yet unclassified' }
MOMethodBrush class >> writesInvocableBehaviour [
	^ true
]

{ #category : #'as yet unclassified' }
MOMethodBrush >> applyTransformationsIfAnyOn: aMOJavaModelWriter [

	policyTransformationMapping ifNotEmpty: [ 
		MOTransformationApplier newMethodLevelApplication
			transformations: policyTransformationMapping;
			writer: aMOJavaModelWriter;
			transform: entity ]
]

{ #category : #visiting }
MOMethodBrush >> visitFunction: aMOFunction [

	entity ifNotNil: [ self halt ].
	entity := writer instantiate: MOMethod forReplacing: aMOFunction.
	entity visibility: aMOFunction visibility copy.
	entity parameters: (aMOFunction parameters collect: [ :p | p copy ]).
	entity selector: aMOFunction selector copy.
	entity modifiers: (aMOFunction modifiers collect: [ :p | p copy ]).
	entity modifiers add: #static.
	entity type: aMOFunction type copy.
	entity block: aMOFunction block copy
]

{ #category : #writing }
MOMethodBrush >> write: aMOFunction into: aMOJavaModelWriter [

	entity := nil.
	writer := aMOJavaModelWriter.
	aMOFunction acceptVisitor: self.
	writer writeMethod: entity. 
	self applyTransformationsIfAnyOn: aMOJavaModelWriter.




	^ entity
]
