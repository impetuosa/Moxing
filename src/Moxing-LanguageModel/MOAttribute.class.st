Class {
	#name : #MOAttribute,
	#superclass : #MOVariable,
	#instVars : [
		'ownerType',
		'visibility'
	],
	#category : #'Moxing-LanguageModel'
}

{ #category : #accessing }
MOAttribute >> acceptVisitor: aJinTypescriptCodeGenerator [
	aJinTypescriptCodeGenerator visitAttribute: self
]

{ #category : #adding }
MOAttribute >> addAnnotationInstance: aMOAnnotationInstance [

	self annotations add: aMOAnnotationInstance
]

{ #category : #accessing }
MOAttribute >> setOwnerClass: aClassObject [ 
	self error: 'Should be using setOwnerType! '
]

{ #category : #accessing }
MOAttribute >> setOwnerType: aClassObject [

	ownerType := aClassObject
]

{ #category : #'as yet unclassified' }
MOAttribute >> visibility [
	^ visibility
]

{ #category : #'as yet unclassified' }
MOAttribute >> visibility: aString [
	visibility := aString
]
