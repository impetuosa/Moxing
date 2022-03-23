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
