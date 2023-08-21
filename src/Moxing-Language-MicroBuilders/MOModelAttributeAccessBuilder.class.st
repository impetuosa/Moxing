"
I know how to build Attributes accessors (such as properties.
"
Class {
	#name : #MOModelAttributeAccessBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'receiverReference'
	],
	#category : #'Moxing-Language-MicroBuilders-Variable-reference'
}

{ #category : #'as yet unclassified' }
MOModelAttributeAccessBuilder >> buildsType [
<generated>
	^MOAttributeAccess
]

{ #category : #'as yet unclassified' }
MOModelAttributeAccessBuilder >> loadBuilderWithEntity: anEntity [

	self receiverReference: anEntity receiverReference.
	self name: anEntity name
]

{ #category : #accessing }
MOModelAttributeAccessBuilder >> name [
	^ name
]

{ #category : #accessing }
MOModelAttributeAccessBuilder >> name: aString [ 
	name := aString 
]

{ #category : #'as yet unclassified' }
MOModelAttributeAccessBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  receiverReference: self receiverReference;
		  name: self name;
		  yourself
]

{ #category : #accessing }
MOModelAttributeAccessBuilder >> receiverReference [
	^ receiverReference
]

{ #category : #accessing }
MOModelAttributeAccessBuilder >> receiverReference: aMOTypeReference [

	receiverReference := aMOTypeReference
]
