Class {
	#name : #MOModelQualifiedTypeReferenceBuilder,
	#superclass : #MOModelTypeReferenceBuilder,
	#instVars : [
		'receiver'
	],
	#category : #'Moxing-MicroBuilders-type-reference'
}

{ #category : #asserting }
MOModelQualifiedTypeReferenceBuilder >> buildSubtypeReference [

	self error: 'whut? '
]

{ #category : #asserting }
MOModelQualifiedTypeReferenceBuilder >> buildTypeReference [

	^ super buildTypeReference
		  receiver: self receiver;
		  yourself
]

{ #category : #asserting }
MOModelQualifiedTypeReferenceBuilder >> buildsType [ 
	^MOQualifiedTypeReference
]

{ #category : #accessing }
MOModelQualifiedTypeReferenceBuilder >> receiver [

	^ receiver
]

{ #category : #accessing }
MOModelQualifiedTypeReferenceBuilder >> receiver: anObject [

	receiver := anObject
]
