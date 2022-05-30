Class {
	#name : #MOModelRedimVariableBuilder,
	#superclass : #MOModelVariableBuilder,
	#instVars : [
		'reference',
		'redimText'
	],
	#category : #'Moxing-MicroBuilders-variables'
}

{ #category : #asserting }
MOModelRedimVariableBuilder >> buildsType [

	<generated>
	^ MOAlceRedimVariable
]

{ #category : #accessing }
MOModelRedimVariableBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self redimText: anEntity redimText.
	self reference: anEntity reference
]

{ #category : #accessing }
MOModelRedimVariableBuilder >> privateBuild [

	^ super privateBuild
		  redimText: self redimText;
		  reference: self reference;
		  yourself
]

{ #category : #accessing }
MOModelRedimVariableBuilder >> redimText [

	^ redimText
]

{ #category : #accessing }
MOModelRedimVariableBuilder >> redimText: anObject [

	redimText := anObject
]

{ #category : #accessing }
MOModelRedimVariableBuilder >> reference [

	^ reference
]

{ #category : #accessing }
MOModelRedimVariableBuilder >> reference: anObject [

	reference := anObject
]
