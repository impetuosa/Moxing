"
I am a special builder for copying nodes 
"
Class {
	#name : #MOModelCopy,
	#superclass : #Object,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnContainment: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	^ self
		  setContainment: aMOObjectObjectRelation
		  using: aChildDelegateLoadingBlock
		  into: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnExpression: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	^ self
		  setExpression: aMOObjectObjectRelation
		  using: aChildDelegateLoadingBlock
		  into: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnProperty: aMOObjectObjectRelation readingValues: aFullBlockClosure into: aDestinationWriter [

	^ self
		  setPropertyCopy: aMOObjectObjectRelation
		  into: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnReference: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	^ self
		  setReference: aMOObjectObjectRelation
		  using: aChildDelegateLoadingBlock
		  into: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> buildCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	aProvenanceEntity allRelations do: [ :relation | 
		relation
			acceptRule: self
			readingValues: aChildDelegateLoadingBlock
			into: aDestinationWriter ]
]

{ #category : #initialization }
MOModelCopy >> setContainment: aMOObjectObjectRelation using: aFullBlockClosure into: aDestinationWriter [

	| destination |
	destination := aFullBlockClosure
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation to.

"	aMOObjectObjectRelation write: destination to: aDestinationWriter"
]

{ #category : #initialization }
MOModelCopy >> setExpression: aMOObjectObjectRelation using: aFullBlockClosure into: aDestinationWriter [

	| destination |
	
	destination := aFullBlockClosure
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation to.
	
	aMOObjectObjectRelation write: destination to: aDestinationWriter
]

{ #category : #initialization }
MOModelCopy >> setPropertyCopy: aMOObjectObjectRelation into: aDestinationWriter [

	| copy |
	" 
	 Some properties may be a ASG object.
	 We do not really copy these objects because they are cache or soft links to be calculated on each ASG and not to be copied.  

	"
	aMOObjectObjectRelation to isMOObject ifTrue: [ ^ self ].

	copy := aMOObjectObjectRelation to shallowCopy .
	aMOObjectObjectRelation write: copy to: aDestinationWriter
]

{ #category : #initialization }
MOModelCopy >> setReference: aMOObjectObjectRelation using: aFullBlockClosure into: aBuildingEntity [

	| destination |

	destination := aFullBlockClosure
		               cull: aBuildingEntity
		               cull: aMOObjectObjectRelation to.
	aMOObjectObjectRelation write: destination to: aBuildingEntity
]

{ #category : #visiting }
MOModelCopy >> visitMOContainmentSlot: aCollection [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOModelCopy >> visitMOContainmentSlotRelation: aMOObjectObjectRelation [ 

]
