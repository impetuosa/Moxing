Class {
	#name : #MOModelNoOpBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'description'
	],
	#category : #'Moxing-Language-MicroBuilders-Expressions'
}

{ #category : #'as yet unclassified' }
MOModelNoOpBuilder >> buildsType [

	^ MONoOp
]

{ #category : #accessing }
MOModelNoOpBuilder >> description [
	^ description
]

{ #category : #accessing }
MOModelNoOpBuilder >> description: aString [ 
	description := aString
]

{ #category : #accessing }
MOModelNoOpBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  description: self description;
		  yourself
]
