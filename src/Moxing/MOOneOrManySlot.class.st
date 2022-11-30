"
I am a regular slot that is aware of the cardinality of my content. Either i am mean to be used with collections or not. 
"
Class {
	#name : #MOOneOrManySlot,
	#superclass : #MORelationSlot,
	#instVars : [
		'cardinality'
	],
	#category : #'Moxing-Core-Slots'
}

{ #category : #generated }
MOOneOrManySlot class >> constantSymbolMany [

	^ #many
]

{ #category : #generated }
MOOneOrManySlot class >> constantSymbolOne [

	^ #one
]

{ #category : #'as yet unclassified' }
MOOneOrManySlot class >> many [

	^ super new
		  cardinality: self constantSymbolMany;
		  yourself
]

{ #category : #'as yet unclassified' }
MOOneOrManySlot class >> new [ 
	^ self error: ' Use many or one'
]

{ #category : #'as yet unclassified' }
MOOneOrManySlot class >> one [ 

	^ super new
		  cardinality: self constantSymbolOne;
		  yourself
]

{ #category : #printing }
MOOneOrManySlot >> cardinality [

	^ cardinality ifNil: [ cardinality := self class constantSymbolOne  ]
]

{ #category : #accessing }
MOOneOrManySlot >> cardinality: aString [ 
	cardinality := aString
]

{ #category : #printing }
MOOneOrManySlot >> initialize: anObject [
	self isToMany ifTrue: [ 
		self write: OrderedCollection new to: anObject ]
]

{ #category : #printing }
MOOneOrManySlot >> isNoneValue: aCollection [

	^ self isToMany
		  ifTrue: [ aCollection isEmptyOrNil ]
		  ifFalse: [ aCollection isNil ]
]

{ #category : #printing }
MOOneOrManySlot >> isToMany [

	^ self cardinality = self class constantSymbolMany 
]

{ #category : #printing }
MOOneOrManySlot >> isToOne [

	^ self cardinality = self class constantSymbolOne
]

{ #category : #printing }
MOOneOrManySlot >> printOn: aStream [

	super printOn: aStream.
	self isToMany
		ifTrue: [ 
			aStream
				nextPutAll: ' ';
				nextPutAll: #many ]
		ifFalse: [ 
			aStream
				nextPutAll: ' ';
				nextPutAll: #one ]
]

{ #category : #printing }
MOOneOrManySlot >> readAll: anObject [

	| val |
	val := self read: anObject.
	val ifNil: [ ^ {  } ].
	^ self isToOne
		  ifTrue: [ { val } ]
		  ifFalse: [ self read: anObject ]
]

{ #category : #printing }
MOOneOrManySlot >> readAllRelations: anObject selecting: aBlock [

	| value |
	value := self read: anObject.
	value ifNil: [ ^ {  } ].
	^ self isToOne
		  ifTrue: [ 
			  (aBlock value: value)
				  ifTrue: [ 
					  { (MODeclarationStructuralRelation new
						   from: anObject to: value;
						   name: self name;
						   slot: self;
						   yourself) } ]
				  ifFalse: [ {  } ] ]
		  ifFalse: [ 
			  (value select: aBlock) collectWithIndex: [ :val :idx | 
				  MODeclarationStructuralRelation new
					  from: anObject to: val;
					  slot: self;
					  name: self name , '%' , idx asString;
					  yourself ] ]
]

{ #category : #printing }
MOOneOrManySlot >> shouldAccept: aValue into: anObject [

	aValue isStonReference ifTrue: [ ^ true ].
	aValue ifNil: [ ^ true ].
	^ self isToMany
		  ifTrue: [ 
			  aValue isCollection and: [ 
				  aValue allSatisfy: [ :e | 
					  self shouldAcceptSingleValue: e into: anObject ] ] ]
		  ifFalse: [ self shouldAcceptSingleValue: aValue into: anObject ]
]

{ #category : #printing }
MOOneOrManySlot >> shouldAcceptSingleValue: aValue into: anObject [

	self subclassResponsibility
]

{ #category : #printing }
MOOneOrManySlot >> wantsInitialization [
	"we need to call the initialize to set the default value for the base slot"
	^true
]
