Class {
	#name : #MONullObjectRelation,
	#superclass : #MOObjectObjectRelation,
	#category : #'Moxing-Core'
}

{ #category : #printing }
MONullObjectRelation >> printOn: aStream [

	aStream
		nextPutAll: '(NOTHING)=[NONE RELATION TO]=>';
		nextPutAll: '(';
		print: to;
		nextPutAll: ')'
]
