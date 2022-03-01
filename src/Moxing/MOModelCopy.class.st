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

	| destination |
	destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation to
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnExpression: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	
	| destination |

	destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation to .
	
	aMOObjectObjectRelation write: destination to: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnProperty: aMOObjectObjectRelation readingValues: aFullBlockClosure into: aDestinationWriter [
	| copy |
	" 
	 Some properties may be a ASG object.
	 We do not really copy these objects because they are cache or soft links to be calculated on each ASG and not to be copied.  

	"
	aMOObjectObjectRelation to isMOObject ifTrue: [ ^ self ].

	copy := aMOObjectObjectRelation to shallowCopy .
	aMOObjectObjectRelation write: copy to: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnReference: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	| destination |
	destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation to.
	aMOObjectObjectRelation write: destination to: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> buildCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock into: aDestinationWriter [

	aProvenanceEntity allRelations do: [ :relation | 
		relation
			acceptRule: self
			readingValues: aChildDelegateLoadingBlock
			into: aDestinationWriter ]
]
