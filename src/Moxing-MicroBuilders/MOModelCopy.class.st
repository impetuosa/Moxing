"
I am a special builder for copying nodes 
"
Class {
	#name : #MOModelCopy,
	#superclass : #Object,
	#category : #'Moxing-MicroBuilders-core'
}

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnDeclaration: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock bindingWithCandidates: anOtherBlock into: aDestinationWriter [

	| destination |
	destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnExpression: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock bindingWithCandidates: anOtherBlock  into: aDestinationWriter [

	| destination |
	destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation.
	aMOObjectObjectRelation write: destination to: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnProperty: aMOObjectObjectRelation readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aDestinationWriter [

	| copy |
	" 
	 Some properties may be a ASG object.
	 We do not really copy these objects because they are cache or soft links to be calculated on each ASG and not to be copied.  

	"
	aMOObjectObjectRelation to isMOObject ifTrue: [ ^ self ].

	copy := aMOObjectObjectRelation to shallowCopy.
	aMOObjectObjectRelation write: copy to: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnReferee: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock bindingWithCandidates: anOtherBlock into: aDestinationWriter [

	| destination |
	(aMOObjectObjectRelation from isKindOf: MOAnnotationInstance) 
		ifFalse: [ self halt ]
	"destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation.
	aMOObjectObjectRelation write: destination to: aDestinationWriter"
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnReference: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock bindingWithCandidates: anOtherBlock into: aDestinationWriter [

	| destination |
	destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation.
	aMOObjectObjectRelation write: destination to: aDestinationWriter
]

{ #category : #'as yet unclassified' }
MOModelCopy >> applyOnStatement: aMOObjectObjectRelation readingValues: aChildDelegateLoadingBlock bindingWithCandidates: anOtherBlock into: aDestinationWriter [

	| destination |
	destination := aChildDelegateLoadingBlock
		               cull: aDestinationWriter
		               cull: aMOObjectObjectRelation
]

{ #category : #'as yet unclassified' }
MOModelCopy >> buildCopyOf: aProvenanceEntity croppingWith: aBlock readingValues: aChildDelegateLoadingBlock bindingWithCandidates: aBindingBlock into: aDestinationWriter [

	^ (aBlock value: aProvenanceEntity to allRelations) do: [ :relation | 
		  relation
			  acceptRule: self
			  readingValues: aChildDelegateLoadingBlock
			  bindingWithCandidates: aBindingBlock
			  into: aDestinationWriter ]
]
