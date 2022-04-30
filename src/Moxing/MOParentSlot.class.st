"
I am just a regular variable. 
I do represent the fact that the value contained by me is a model object that contains my owning object. 
"
Class {
	#name : #MOParentSlot,
	#superclass : #InstanceVariableSlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #asserting }
MOParentSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure into: aWriter [

	^ aRule
		  applyOnParent: aRelationObject
		  readingValues: aFullBlockClosure
		  into: aWriter
]

{ #category : #asserting }
MOParentSlot >> emitStore: aMethodBuilder [
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

{ #category : #asserting }
MOParentSlot >> isMOSlot [

	^ true
]

{ #category : #asserting }
MOParentSlot >> shouldAccept: aValue [

	^ aValue isNil or: [ aValue isReference not ]
]

{ #category : #asserting }
MOParentSlot >> write: aValue to: anObject [

	super write: aValue to: anObject
]
