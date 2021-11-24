Class {
	#name : #MOModelVariableReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'candidate',
		'kindOfEntry'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelVariableReferenceBuilder >> build [

	^ (self instantiate: MOVariableReference)
		  name: name;
		  candidate: candidate;
		  kind: kindOfEntry;
		  yourself
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> candidate: aMOAttribute [ 
	candidate := aMOAttribute 
]

{ #category : #'as yet unclassified' }
MOModelVariableReferenceBuilder >> kindOfEntry: aString [

	kindOfEntry := aString asSymbol
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> name: aString [ 
	name := aString
]

{ #category : #generated }
MOModelVariableReferenceBuilder >> variable: aMOAttribute [ 
	self name: aMOAttribute name.
	self candidate: aMOAttribute. 
	self kindOfEntry: aMOAttribute className. 
]
