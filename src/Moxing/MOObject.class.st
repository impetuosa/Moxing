Class {
	#name : #MOObject,
	#superclass : #Object,
	#instVars : [
		'#parent => MOParentSlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MOObject class >> new [
	^ self error: 'must give model'
]

{ #category : #'instance creation' }
MOObject class >> newInstanceFromModel [ 
	^ super new
]

{ #category : #accessing }
MOObject >> acceptVisitor: aVisitor [
	self subclassResponsibility 
]

{ #category : #traverse }
MOObject >> allContainmentRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOContainmentSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> allContainments [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOContainmentSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ])
	  , (self allExpressions select: [ :expr | expr isReference not ])
]

{ #category : #traverse }
MOObject >> allExpressionRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressionSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> allExpressionRelationsSelectValue: aBlock [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressionSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self selecting: aBlock ]
]

{ #category : #traverse }
MOObject >> allExpressions [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOExpressionSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ]) 
]

{ #category : #traverse }
MOObject >> allProperties [

	^ (self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | slot read: self ])  
]

{ #category : #traverse }
MOObject >> allPropertyRelations [

	^ self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | 
			  MOObjectObjectRelation new
				  to: (slot read: self);
				  name: slot name;
				  slot: slot;
				  yourself ]
]

{ #category : #traverse }
MOObject >> allReferenceRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOReferenceSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> allReferences [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOReferenceSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ])
	  , (self allExpressions asOrderedCollection select: [ :expr | 
			   expr isReference ])
]

{ #category : #traverse }
MOObject >> initialize [

	super initialize.
	self class initializeSlots: self
]

{ #category : #testing }
MOObject >> isInvocation [

	^ false
]

{ #category : #traverse }
MOObject >> isMOObject [
	^ true  
]

{ #category : #testing }
MOObject >> isReference [
	^ false
]

{ #category : #testing }
MOObject >> isType [
	^ false
]

{ #category : #testing }
MOObject >> isTypeReference [

	^ false
]

{ #category : #initialization }
MOObject >> isWriter [ 
	^ false
]

{ #category : #accessing }
MOObject >> parent [
	^ parent
]

{ #category : #accessing }
MOObject >> parent: aParent [
	parent := aParent.
	
]

{ #category : #initialization }
MOObject >> setAsParentOf: aMOAnnotationInstance [ 
	aMOAnnotationInstance parent: self 
]

{ #category : #'as yet unclassified' }
MOObject >> setterNameFor: aMOBlock [

	| slots |
	slots := self class allSlots select: [ :a | 
		         (a read: self) = aMOBlock ].
	self assert: slots size = 1.
	^ slots first name , ':'
]
