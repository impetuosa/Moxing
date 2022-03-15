Class {
	#name : #MOAttributeAccess,
	#superclass : #MOTypedReference,
	#instVars : [
		'#receiverReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOAttributeAccess >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitAttributeAccess: self
]

{ #category : #private }
MOAttributeAccess >> printOn: aStream [

	aStream
		print: receiverReference;
		nextPutAll: '.';
		nextPutAll: name
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
MOAttributeAccess >> refersToObjectsLike: aCollection [

	aCollection isCollection ifTrue: [ 
		self assert: aCollection size = 3.
		^ true ].
	^ aCollection
		  ifNil: [ true ]
		  ifNotNil: [ aCollection species = MOAttribute ]
]
