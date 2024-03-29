Class {
	#name : #MOAlias,
	#superclass : #MOPrimitiveType,
	#instVars : [
		'#typeReference => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAlias >> acceptVisitor: ads [

	^ ads visitAlias: self
]

{ #category : #accessing }
MOAlias >> allMethods [

	^ typeReference referee allMethods
]

{ #category : #accessing }
MOAlias >> allRelations [

	^ self typeReference type ifNil: [ {  } ] ifNotNil: [ :t | 
		  t allRelations collect: [ :a | 
			  a
				  from: self;
				  yourself ] ]
]

{ #category : #accessing }
MOAlias >> finalize [

	| relations |
	relations := super allRelations.
	self class allSlots do: [ :slot | slot write: nil to: self ].
	relations do: [ :r | r to finalize ].
	self becomeForward: {}
]

{ #category : #accessing }
MOAlias >> isPrimitiveType [

	^ typeReference referee isPrimitiveType
]

{ #category : #accessing }
MOAlias >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: ' AliasOf (';
		nextPutAll: typeReference name;
		nextPutAll: ')'
]

{ #category : #accessing }
MOAlias >> typeReference [
	^ typeReference
]

{ #category : #accessing }
MOAlias >> typeReference: aMOPrimitiveTypeReference [ 
	typeReference := aMOPrimitiveTypeReference
]
