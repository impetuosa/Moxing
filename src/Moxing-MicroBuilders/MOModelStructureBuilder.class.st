Class {
	#name : #MOModelStructureBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'attributes',
		'visibility',
		'modifiers'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOModelStructureBuilder >> addAttribute: aMOAttribute [

	self attributes add: aMOAttribute
]

{ #category : #accessing }
MOModelStructureBuilder >> attributes [

	^ attributes ifNil: [ attributes := OrderedCollection new ]
]

{ #category : #accessing }
MOModelStructureBuilder >> attributes: aCollection [ 
	attributes := aCollection
]

{ #category : #'as yet unclassified' }
MOModelStructureBuilder >> buildsType [

	^ MOStructure
]

{ #category : #accessing }
MOModelStructureBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self attributes: anEntity attributes.
	self visibility: anEntity visibility.
	self modifiers: anEntity modifiers
]

{ #category : #accessing }
MOModelStructureBuilder >> modifiers [
	^ modifiers
]

{ #category : #generated }
MOModelStructureBuilder >> modifiers: aCollection [

	modifiers := aCollection
]

{ #category : #accessing }
MOModelStructureBuilder >> name [
	^ name ifNil: [  self assert: ' name must be set ' ]
]

{ #category : #accessing }
MOModelStructureBuilder >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MOModelStructureBuilder >> privateBuild [

	^ (self instantiate: MOStructure)
		  name: self name;
		  visibility: self visibility;
		  modifiers: self modifiers;
		  attributes: self attributes;
		  yourself
]

{ #category : #accessing }
MOModelStructureBuilder >> visibility [
	^ visibility
]

{ #category : #accessing }
MOModelStructureBuilder >> visibility: aString [

	visibility := aString
]
