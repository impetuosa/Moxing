Class {
	#name : #MOModelAngularDocumentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'document',
		'name'
	],
	#category : #'Moxing-Angular-Building'
}

{ #category : #accessing }
MOModelAngularDocumentBuilder >> document [
	^ document
]

{ #category : #accessing }
MOModelAngularDocumentBuilder >> document: aXMLDocument [ 
	document := aXMLDocument
]

{ #category : #accessing }
MOModelAngularDocumentBuilder >> loadBuilderWithEntity: anEntity [

	self document: anEntity document.
	self name: anEntity name
]

{ #category : #accessing }
MOModelAngularDocumentBuilder >> name [
	^ name
]

{ #category : #accessing }
MOModelAngularDocumentBuilder >> name: aName [

	name := aName
]

{ #category : #accessing }
MOModelAngularDocumentBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  document: self document;
		  name: self name;
		  yourself
]
