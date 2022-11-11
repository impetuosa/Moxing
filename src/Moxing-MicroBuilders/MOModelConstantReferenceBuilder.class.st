"
I build references to constants 
"
Class {
	#name : #MOModelConstantReferenceBuilder,
	#superclass : #MOModelVariableReferenceBuilder,
	#category : #'Moxing-MicroBuilders-variable-reference'
}

{ #category : #'as yet unclassified' }
MOModelConstantReferenceBuilder >> buildsType [
<generated>
	^MOConstantReference
]

{ #category : #'as yet unclassified' }
MOModelConstantReferenceBuilder >> loadBuilderWithEntity: anEntity [ 
	self name: anEntity name. 
 self referee: anEntity referee. 
 self kindOfEntry: anEntity kind. 
 
	
]

{ #category : #'as yet unclassified' }
MOModelConstantReferenceBuilder >> privateBuild [

	^ (self instantiate: MOConstantReference)
		  name: name;
		  referee: candidate;
		  kind: kindOfEntry;
		  yourself
]
