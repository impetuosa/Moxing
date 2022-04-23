Class {
	#name : #MOModelAngularComponentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'template',
		'behavior',
		'css'
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
MOModelAngularComponentBuilder >> css [
	 ^ css
]

{ #category : #generated }
MOModelAngularComponentBuilder >> css: aCssDocument [ 
	 css := aCssDocument 
]

{ #category : #'as yet unclassified' }
MOModelAngularComponentBuilder >> loadBuilderWithEntity: anEntity [

	self behavior: anEntity behavior.
	self template: anEntity template.
	self css: anEntity css
]

{ #category : #'as yet unclassified' }
MOModelAngularComponentBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  behavior: self behavior;
		  template: self template;
		  css: self css;
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
