"
I am a relation which comes from a null declaration. Often used for root: Deus ex relation
"
Class {
	#name : #MONullDeclarationRelation,
	#superclass : #MODeclarationStructuralRelation,
	#category : #'Moxing-Core'
}

{ #category : #printing }
MONullDeclarationRelation >> printOn: aStream [

	aStream
		nextPutAll: '(NOTHING)=[NONE RELATION TO]=>';
		nextPutAll: '(';
		print: to;
		nextPutAll: ')'
]
