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
	#category : #'Moxing-Language-MicroBuilders-Variable-reference'
}

{ #category : #'as yet unclassified' }
MOModelVariableReferenceBuilder >> buildsType [
<generated>
	^MOVariableReference
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
 self referee: anEntity referee. 
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
		  referee: candidate;
		  kind: kindOfEntry;
		  yourself
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> referee [
	^ candidate
]

{ #category : #accessing }
MOModelVariableReferenceBuilder >> referee: aMOAttribute [ 
	candidate := aMOAttribute 
]

{ #category : #generated }
MOModelVariableReferenceBuilder >> variable: aMOAttribute [ 
	self name: aMOAttribute name.
	self referee: aMOAttribute. 
	self kindOfEntry: aMOAttribute className. 
]
