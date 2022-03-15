Class {
	#name : #MORelationSlot,
	#superclass : #InstanceVariableSlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #printing }
MORelationSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure into: aWriter [
	self subclassResponsibility 

	
]

{ #category : #printing }
MORelationSlot >> emitStore: aMethodBuilder [
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
MORelationSlot >> readAll: anObject [

	| val |
	val := self read: anObject.
	^ val ifNil: [ {  } ] ifNotNil: [ { val } ]
]

{ #category : #printing }
MORelationSlot >> readAllRelations: anObject [

	^ self readAllRelations: anObject selecting: [ :a | true ]
]

{ #category : #printing }
MORelationSlot >> readAllRelations: anObject selecting: aBlock [

	| value |
	value := self read: anObject.
	value ifNil: [ ^ {  } ].
	^ (aBlock value: value)
		  ifTrue: [ 
			  { (MOObjectObjectRelation new
				   from: anObject to: value;
				   name: self name;
				   slot: self;
				   yourself) } ]
		  ifFalse: [ {  } ]
]

{ #category : #printing }
MORelationSlot >> shouldAccept: aValue  into: anObject [ 
	self subclassResponsibility 
]

{ #category : #printing }
MORelationSlot >> unsafeWrite: aValue to: anObject [

	^ super write: aValue to: anObject
]

{ #category : #printing }
MORelationSlot >> write: aValue to: anObject [

	^ (self shouldAccept: aValue into: anObject)
		  ifTrue: [ self unsafeWrite: aValue to: anObject ]
		  ifFalse: [ 
		  self error: 'The slot does not accept this kind of values ' ]
]
