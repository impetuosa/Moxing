Class {
	#name : #MOModelCopyExtensionMethodBuilder,
	#superclass : #MOModelCopy,
	#category : #'Moxing-Smalltalk-builer'
}

{ #category : #'as yet unclassified' }
MOModelCopyExtensionMethodBuilder >> buildCopyOf: aProvenanceEntity croppingWith: aBlock readingValues: aChildDelegateLoadingBlock bindingWithCandidates: aBindingBlock into: aDestinationWriter [
	| relations classMethods |
	relations := (aBlock value: aProvenanceEntity to allRelations).
	classMethods := relations select:[ :a |a relationName = #extensionClassMethods].
	relations removeAll: classMethods. 
	
	aDestinationWriter setAsAddingMethods.
	(aBlock value: relations) do: [ :relation | 
		  relation
			  acceptRule: self
			  readingValues: aChildDelegateLoadingBlock
			  bindingWithCandidates: aBindingBlock
			  into: aDestinationWriter ].
		aDestinationWriter setAsAddingClassMethods .
		(aBlock value: classMethods) do: [ :relation | 
		  relation
			  acceptRule: self
			  readingValues: aChildDelegateLoadingBlock
			  bindingWithCandidates: aBindingBlock
			  into: aDestinationWriter ]
]
