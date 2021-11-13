Class {
	#name : #MOMethodBrush,
	#superclass : #MOBrush,
	#instVars : [
		'entity',
		'writer'
	],
	#category : #'Moxing-Brushes'
}

{ #category : #visiting }
MOMethodBrush >> visitFunction: aMOFunction [

	entity ifNotNil: [ self halt ].
	entity := writer instantiate: MOMethod forReplacing: aMOFunction.
	entity visibility: aMOFunction visibility.
	entity parameters: aMOFunction parameters.
	entity selector: aMOFunction selector.
	entity modifiers: aMOFunction modifiers.
	entity modifiers add: #static.
	entity type: aMOFunction type.
	entity block: aMOFunction block
]

{ #category : #writing }
MOMethodBrush >> write: aMOFunction into: aMOJavaModelWriter [

	entity := nil.
	writer := aMOJavaModelWriter.
	aMOFunction acceptVisitor: self.
	aMOJavaModelWriter writeMethod: entity.
	^ entity
]

{ #category : #'as yet unclassified' }
MOMethodBrush >> writesInvocableBehaviour [
	^ true
]
