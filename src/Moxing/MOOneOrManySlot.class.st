"
I am a regular slot that is aware of the cardinality of my content. Either i am mean to be used with collections or not. 
"
Class {
	#name : #MOOneOrManySlot,
	#superclass : #InstanceVariableSlot,
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
MOOneOrManySlot >> emitStore: aMethodBuilder [
	"generate bytecode to call the reflective write method of the Slot"
	| tempName |
	tempName := '0slotTempForStackManipulation'.  
	aMethodBuilder
		addTemp: tempName;
		storeTemp: tempName;
		popTop;
		pushReceiver;
		pushLiteral: self;
		pushTemp: tempName;
		send: #writeSlot:value:
]

{ #category : #printing }
MOOneOrManySlot >> initialize: anObject [
	self isToMany ifTrue: [ 
		self write: OrderedCollection new to: anObject ]
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
MOOneOrManySlot >> readAllRelations: anObject [

	^ self readAllRelations: anObject selecting: [ :a | true ]
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
					  { (MOObjectObjectRelation new
						   to: value;
						   name: self name;
						   slot: self;
						   yourself) } ]
				  ifFalse: [ {  } ] ]
		  ifFalse: [ 
			  (value select: aBlock) collectWithIndex: [ :val :idx | 
				  MOObjectObjectRelation new
					  to: val;
					  slot: self;
					  name: self name , '%' , idx asString;
					  yourself ] ]
]

{ #category : #printing }
MOOneOrManySlot >> shouldAccept: aValue  into: anObject [ 
	self subclassResponsibility 
]

{ #category : #printing }
MOOneOrManySlot >> shouldAcceptSingleOrMany: aValue [

	aValue ifNil: [ ^ true ].
	^ self isToMany
		  ifTrue: [ 
			  aValue isCollection and: [ 
				  aValue allSatisfy: [ :e | self shouldAccept: e ] ] ]
		  ifFalse: [ self shouldAccept: aValue ]
]

{ #category : #printing }
MOOneOrManySlot >> shouldAcceptSingleOrMany: aValue into: anObject [

	aValue ifNil: [ ^ true ].
	^ self isToMany
		  ifTrue: [ 
			  aValue isCollection and: [ 
				  aValue allSatisfy: [ :e | self shouldAccept: e into: anObject ] ] ]
		  ifFalse: [ self shouldAccept: aValue into: anObject ]
]

{ #category : #printing }
MOOneOrManySlot >> theContentIsValidFor: anObject [

	^ self shouldAcceptSingleOrMany: (self read: anObject)
]

{ #category : #printing }
MOOneOrManySlot >> wantsInitialization [
	"we need to call the initialize to set the default value for the base slot"
	^true
]

{ #category : #printing }
MOOneOrManySlot >> write: aValue to: anObject [

	(self shouldAcceptSingleOrMany: aValue into: anObject)
		ifTrue: [ super write: aValue to: anObject ]
		ifFalse: [ 
		self error: 'The slot does not accept this kind of values ' ]
]
