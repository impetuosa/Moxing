Class {
	#name : #MOModelNoOpBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'description'
	],
	#category : #'Moxing-MicroBuilders-expressions'
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
