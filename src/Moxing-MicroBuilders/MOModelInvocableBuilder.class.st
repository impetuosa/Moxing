Class {
	#name : #MOModelInvocableBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'body',
		'parameters',
		'modifiers',
		'visibility'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #adding }
MOModelInvocableBuilder >> addAnnotationInstance: aMOAnnotationInstance [

	self annotationInstances add: aMOAnnotationInstance
]

{ #category : #adding }
MOModelInvocableBuilder >> addModifier: aString [ 
	self modifiers add: aString 
]

{ #category : #adding }
MOModelInvocableBuilder >> addParameter: aMOParameter [

	self parameters add: aMOParameter
]

{ #category : #adding }
MOModelInvocableBuilder >> addThrownTypeReference: aMOTypeReference [

	self thrownTypeReferences add: aMOTypeReference
]

{ #category : #generated }
MOModelInvocableBuilder >> block: aMOBlock [

	self body: aMOBlock
]

{ #category : #accessing }
MOModelInvocableBuilder >> body [

	^ body ifNil: [
		  body := self
			          findInModel: [ :a | a isKindOf: MOEmptyBlock ]
			          ifNone: [ self instantiateSubClass: MOEmptyBlock ] ]
]

{ #category : #generated }
MOModelInvocableBuilder >> body: aMOBlock [  
	body := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelInvocableBuilder >> buildsType [
<generated>
	^MOConstructor
]

{ #category : #'as yet unclassified' }
MOModelInvocableBuilder >> loadBuilderWithEntity: anEntity [

	self visibility: anEntity visibility.
	self modifiers: anEntity modifiers.
	self parameters: anEntity parameters.
	self body: anEntity block
]

{ #category : #adding }
MOModelInvocableBuilder >> modifiers [

	^ modifiers ifNil: [ modifiers := OrderedCollection new ]
]

{ #category : #accessing }
MOModelInvocableBuilder >> modifiers: aCollection [ 
	modifiers := aCollection
]

{ #category : #generated }
MOModelInvocableBuilder >> parameters [

	^ parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #accessing }
MOModelInvocableBuilder >> parameters: anObject [

	parameters := anObject
]

{ #category : #'as yet unclassified' }
MOModelInvocableBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  visibility: self visibility;
		  modifiers: self modifiers;
		  parameters: self parameters;
		  block: self body;
		  yourself
]

{ #category : #accessing }
MOModelInvocableBuilder >> visibility [
	^ visibility
]

{ #category : #accessing }
MOModelInvocableBuilder >> visibility: aString [

	visibility := aString
]
