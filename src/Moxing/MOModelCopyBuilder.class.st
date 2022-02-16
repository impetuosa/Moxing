"
I am a special builder for copying nodes 
"
Class {
	#name : #MOModelCopyBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'build',
		'anchor'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelCopyBuilder >> anchor [
	^ anchor
]

{ #category : #asserting }
MOModelCopyBuilder >> bindingConfiguration [

	^ {  }
]

{ #category : #accessing }
MOModelCopyBuilder >> build: anObject [

	build := anObject
]

{ #category : #'as yet unclassified' }
MOModelCopyBuilder >> buildCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock [

	build := self instantiate: aProvenanceEntity class.
	" set temporary anchor "
	build anchor: anchor.

	aProvenanceEntity allPropertyRelations do: [ :r | 
		self setPropertyCopy: r into: build ].
	
	aProvenanceEntity allReferenceRelations do: [ :r | 
		self setReference: r using: aChildDelegateLoadingBlock into: build ].
	
	aProvenanceEntity allExpressionRelations do: [ :r | 
		self setExpression: r using: aChildDelegateLoadingBlock into: build ].

	aProvenanceEntity allContainmentRelations do: [ :r | 
		self setContainment: r using: aChildDelegateLoadingBlock into: build ].




	build anchor: nil.
	^ build
]

{ #category : #asserting }
MOModelCopyBuilder >> buildsType [ 
	 ^  self error: 'whut?'
]

{ #category : #'as yet unclassified' }
MOModelCopyBuilder >> loadBuilderWithEntity: anEntity [ 
	
	
]

{ #category : #'as yet unclassified' }
MOModelCopyBuilder >> privateBuild [

	^ build
]

{ #category : #'as yet unclassified' }
MOModelCopyBuilder >> processesValue: originValue with: aFullBlockClosure [

	^ (originValue isCollection and: [ 
		   originValue isString not and: [ build isKindOf: MOBlock ] ])
		  ifTrue: [ 
			  originValue collect: [ :d | 
				  self processesValue: d with: aFullBlockClosure ].
			   ]
		  ifFalse: [ 
			  (self shouldBeProcessed: originValue)
				  ifTrue: [ aFullBlockClosure cull: build cull: originValue ]
				  ifFalse: [ originValue ] ]
]

{ #category : #initialization }
MOModelCopyBuilder >> setContainment: aMOObjectObjectRelation using: aFullBlockClosure into: aBuildingEntity [

	| destination |
	destination := aFullBlockClosure
		               cull: aBuildingEntity
		               cull: aMOObjectObjectRelation to.
"	aMOObjectObjectRelation write: destination to: aBuildingEntity"
]

{ #category : #initialization }
MOModelCopyBuilder >> setExpression: aMOObjectObjectRelation using: aFullBlockClosure into: aBuildingEntity [

	| destination |
	destination := aFullBlockClosure
		               cull: aBuildingEntity
		               cull: aMOObjectObjectRelation to.
	aMOObjectObjectRelation write: destination to: aBuildingEntity
]

{ #category : #initialization }
MOModelCopyBuilder >> setPropertyCopy: aMOObjectObjectRelation into: aMOClass [

	| copy |
	" 
	 Some properties may be a ASG object.
	 We do not really copy these objects because they are cache or soft links to be calculated on each ASG and not to be copied.  

	"
	aMOObjectObjectRelation to isMOObject ifTrue: [ ^ self ].

	copy := aMOObjectObjectRelation to shallowCopy.
	aMOObjectObjectRelation write: copy to: aMOClass
]

{ #category : #initialization }
MOModelCopyBuilder >> setReference: aMOObjectObjectRelation using: aFullBlockClosure into: aBuildingEntity [

	| destination |
	destination := aFullBlockClosure
		               cull: aBuildingEntity
		               cull: aMOObjectObjectRelation to.
	aMOObjectObjectRelation write: destination to: aBuildingEntity
]

{ #category : #asserting }
MOModelCopyBuilder >> shouldBeProcessed: anObject [

	^ (anObject isKindOf: MOObject) and: [ 
		  (anObject isKindOf: MOLanguage) not ]
]

{ #category : #asserting }
MOModelCopyBuilder >> shouldBeSet: anObject destinationEntity: destinationValue [

	destinationValue = build ifTrue: [ ^ false ].

	^ (anObject isKindOf: MOReference) or: [ 
		  (anObject isKindOf: MOLanguage) not and: [ 
			  (anObject isKindOf: JinAnchor) not and: [ anObject isNotNil ] ] ]
]

{ #category : #'as yet unclassified' }
MOModelCopyBuilder >> useAnchor: aMOAnchor [

	anchor := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOModelCopyBuilder >> with: anInstanceVariableSlot write: anUndefinedObject to: aMOVariable [ 
	aMOVariable perform: anInstanceVariableSlot name,':' withArguments: { anUndefinedObject  }
]
