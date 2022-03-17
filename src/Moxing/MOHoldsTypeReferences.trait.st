Trait {
	#name : #MOHoldsTypeReferences,
	#instVars : [
		'typeReferences'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOHoldsTypeReferences >> handlesTypeReferences [
	^ true 
]

{ #category : #initialization }
MOHoldsTypeReferences >> typeReferenceFullNamed: aString [

	| ref |
	ref := self parentWriter handlesTypeReferences
		       ifTrue: [ self parentWriter typeReferenceFullNamed: aString ]
		       ifFalse: [ 
			       self typeReferences at: aString ifAbsentPut: [ 
				       self builder typeReferenceBuilder
					       fullName: aString;
					       build ] ].
	self assert: ref isReference.
	^ ref
]

{ #category : #initialization }
MOHoldsTypeReferences >> typeReferenceNamed: aString [

	| ref |
	ref := self parentWriter handlesTypeReferences
		       ifTrue: [ self parentWriter typeReferenceNamed: aString ]
		       ifFalse: [ 
			       self typeReferences at: aString ifAbsentPut: [ 
				       self builder typeReferenceBuilder
					       name: aString;
					       build ] ].
	self assert: ref isReference.
	^ ref
]

{ #category : #initialization }
MOHoldsTypeReferences >> typeReferences [
	^ typeReferences ifNil: [ typeReferences := Dictionary new ]
]