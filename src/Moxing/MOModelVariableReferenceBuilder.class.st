"
I build references to variables 
"
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

{ #category : #'as yet unclassified' }
MOModelVariableReferenceBuilder >> bindingConfiguration [

	"On the left the attribute names for MOVariableReference. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #name. #name }.
		  { #candidate. #candidate }.
		  { #kind. #kindOfEntry } }
]

{ #category : #'as yet unclassified' }
MOModelVariableReferenceBuilder >> buildsType [
<generated>
	^MOVariableReference
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> candidate [
	^ candidate
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> candidate: aMOAttribute [ 
	candidate := aMOAttribute 
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> kindOfEntry [
	^ kindOfEntry
]

{ #category : #'as yet unclassified' }
MOModelVariableReferenceBuilder >> kindOfEntry: aString [

	kindOfEntry := aString asSymbol
]

{ #category : #'as yet unclassified' }
MOModelVariableReferenceBuilder >> loadBuilderWithEntity: anEntity [ 
	self name: anEntity name. 
 self candidate: anEntity candidate. 
 self kindOfEntry: anEntity kind. 
 
	
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> name [
	^ name
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
MOModelVariableReferenceBuilder >> privateBuild [

	^ (self instantiate: MOVariableReference)
		  name: name;
		  candidate: candidate;
		  kind: kindOfEntry;
		  yourself
]

{ #category : #generated }
MOModelVariableReferenceBuilder >> variable: aMOAttribute [ 
	self name: aMOAttribute name.
	self candidate: aMOAttribute. 
	self kindOfEntry: aMOAttribute className. 
]
