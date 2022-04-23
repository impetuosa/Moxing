"
I am a derivative model. 
A model on changing transition. I do hold new entities and relations before been add to the real model 
"
Class {
	#name : #MOModelDerivative,
	#superclass : #Object,
	#instVars : [
		'entities',
		'model'
	],
	#category : #'Moxing-Core'
}

{ #category : #enumerating }
MOModelDerivative >> allEntitiesSelect: aFullBlockClosure [

	^ (entities select: aFullBlockClosure)
	  , (model entities select: aFullBlockClosure)
]

{ #category : #accessing }
MOModelDerivative >> anchor [

	^ model anchor
]

{ #category : #enumerating }
MOModelDerivative >> catalogEntitiesSelect: aFullBlockClosure [

	^ model catalog entities select: aFullBlockClosure
]

{ #category : #accessing }
MOModelDerivative >> entities [
	^ entities
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> exclusivelyincludes: anEntity [

	^ entities includes: anEntity
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> getModifiableVersionOf: aMOVariable [

	^ (entities includes: aMOVariable)
		  ifTrue: [ aMOVariable ]
		  ifFalse: [ self shallowCopy: aMOVariable ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> includes: anEntity [

	^ (entities includes: anEntity) or: [ model includes: anEntity ]
]

{ #category : #accessing }
MOModelDerivative >> initialize [ 
	super initialize.
	entities := OrderedCollection new
]

{ #category : #'instance creation' }
MOModelDerivative >> instantiate: aClass [ 
	| instance | 
	instance := aClass newInstanceFromModel .
	entities add: instance.
	^ instance
]

{ #category : #accessing }
MOModelDerivative >> language [

	^ model language
]

{ #category : #accessing }
MOModelDerivative >> mapSpaceAnchor [

	^ model mapSpaceAnchor
]

{ #category : #accessing }
MOModelDerivative >> model [
	^ model
]

{ #category : #accessing }
MOModelDerivative >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #accessing }
MOModelDerivative >> name [
	^ model name
]

{ #category : #accessing }
MOModelDerivative >> objects [
	^ model objects 
]

{ #category : #enumerating }
MOModelDerivative >> objectsSelect: aFullBlockClosure [ 
	^ model objects select: aFullBlockClosure 
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> primitiveTypeNamed: aString ifAbsent: aFullBlockClosure [

	^ entities
		  detect: [ :e | 
		  (e isKindOf: MOPrimitiveType) and: [ e name = aString ] ]
		  ifNone: [ 
		  model primitiveTypeNamed: aString ifAbsent: aFullBlockClosure ]
]

{ #category : #registry }
MOModelDerivative >> register: aMOBlock [

	entities add: aMOBlock
]

{ #category : #removing }
MOModelDerivative >> removeEntity: aFylgjaCandidateStub [

	entities remove: aFylgjaCandidateStub
]

{ #category : #accessing }
MOModelDerivative >> root [

	^ model root
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> shallowCopy: anEntity [

	| e |
	e := anEntity copy.
	
	self register: e.
	e class allSlots do: [ :slot | 
		(slot read: e) isCollection ifTrue: [ 
			slot write: (slot read: e) copy to: e ] ].
	^ e
	


]

{ #category : #'as yet unclassified' }
MOModelDerivative >> shallowRelationCopy: aMOObjectObjectRelation [

	| relation to |
	relation := aMOObjectObjectRelation copy.
	to := self shallowCopy: aMOObjectObjectRelation to.

	relation to: to.
	^ relation
]

{ #category : #accessing }
MOModelDerivative >> swap: aFylgjaCandidateStub with: aMOVariableReference [

	aFylgjaCandidateStub = aMOVariableReference ifFalse: [ 
		entities remove: aFylgjaCandidateStub.
		self assert: (entities includes: aMOVariableReference) ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> swap: aMOExit with: aMOReturnEmpty context: aMOBlock [

	self assert: (entities includes: aMOExit).
	self assert: (model entities includes: aMOExit) not.
	entities replaceAll: aMOExit with: aMOReturnEmpty.
	aMOBlock statements replaceAll: aMOExit with: aMOReturnEmpty
]

{ #category : #'instance creation' }
MOModelDerivative >> writer [

	^ MOModelWriter new
		  model: self;
		  yourself
]
