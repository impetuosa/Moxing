Class {
	#name : #MOAttributeAccess,
	#superclass : #MOTypedReference,
	#instVars : [
		'#receiverReference => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOAttributeAccess >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitAttributeAccess: self
]

{ #category : #accessing }
MOAttributeAccess >> canBeReferredAsArrayAccess [

	^ true
]

{ #category : #private }
MOAttributeAccess >> printOn: aStream [

	aStream
		print: receiverReference;
		nextPutAll: '.';
		nextPutAll: self name
]

{ #category : #accessing }
MOAttributeAccess >> receiver [
	self shouldBeImplemented.
]

{ #category : #accessing }
MOAttributeAccess >> receiverReference [
	^ receiverReference
]

{ #category : #accessing }
MOAttributeAccess >> receiverReference: aMOVariableReference [

	receiverReference := aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOAttributeAccess >> refersToObjectsLike: aMOPrimitiveType [

	^ aMOPrimitiveType isCollection
		  ifTrue: [ 
		  aMOPrimitiveType anySatisfy: [ :a | (self refersToObjectsLikeOrStonRef: a) ] ]
		  ifFalse: [ aMOPrimitiveType canBeReferredAsAttribute ]
]
