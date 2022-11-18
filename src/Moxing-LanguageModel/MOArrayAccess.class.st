Class {
	#name : #MOArrayAccess,
	#superclass : #MOAttributeAccess,
	#instVars : [
		'#arguments => MOExpressesSlot many'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #visiting }
MOArrayAccess >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitArrayAccess: self
]

{ #category : #accessing }
MOArrayAccess >> arguments [
	^ arguments
]

{ #category : #accessing }
MOArrayAccess >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #visiting }
MOArrayAccess >> printOn: aStream [

	aStream
		print: receiverReference;
		nextPutAll: '[';
		print: arguments;
		nextPutAll: ']'
]

{ #category : #accessing }
MOArrayAccess >> refersToObjectsLike: aMOPrimitiveType [

	^ aMOPrimitiveType isCollection
		  ifTrue: [ 
		  aMOPrimitiveType anySatisfy: [ :a | (self refersToObjectsLikeOrStonRef: a) ] ]
		  ifFalse: [ aMOPrimitiveType canBeReferredAsArrayAccess ]
]
