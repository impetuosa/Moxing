Class {
	#name : #MOModelAngularComponentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'template',
		'behavior'
	],
	#category : #'Moxing-Angular-Building'
}

{ #category : #accessing }
MOModelAngularComponentBuilder >> behavior [
	^ behavior
]

{ #category : #accessing }
MOModelAngularComponentBuilder >> behavior: aMODeclarationUnit [

	behavior := aMODeclarationUnit
]

{ #category : #'as yet unclassified' }
MOModelAngularComponentBuilder >> buildsType [

	^ MOAngularComponent
]

{ #category : #'as yet unclassified' }
MOModelAngularComponentBuilder >> loadBuilderWithEntity: anEntity [

	self behavior: anEntity behavior.
	self template: anEntity template
]

{ #category : #'as yet unclassified' }
MOModelAngularComponentBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  behavior: self behavior;
		  template: self template;
		  yourself
]

{ #category : #accessing }
MOModelAngularComponentBuilder >> template [
	^ template
]

{ #category : #generated }
MOModelAngularComponentBuilder >> template: aXMLDocument [

	template := aXMLDocument
]
