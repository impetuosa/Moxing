Class {
	#name : #MOSelfReference,
	#superclass : #MOTypedReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #'as yet unclassified' }
MOSelfReference class >> isRenamable [
	^ false
]

{ #category : #accessing }
MOSelfReference >> acceptVisitor: aMOJavaCodeGenerator [

	^ aMOJavaCodeGenerator visitSelfReference: self
]

{ #category : #'as yet unclassified' }
MOSelfReference >> callingClass [

	| p |
	p := self parent.
	[ p isNil or: [ p isType or: [ p isMethodExtension ] ] ] whileFalse: [ 
		p := p parent ].
	^ p
]

{ #category : #'as yet unclassified' }
MOSelfReference >> name [

	^ name ifNil: [ name := #self ]
]

{ #category : #accessing }
MOSelfReference >> printOn: aStream [ 
	aStream nextPutAll: 'REF SELF'
]

{ #category : #'as yet unclassified' }
MOSelfReference >> refersToObjectsLike: aType [

	^ aType canbeReferredAsSelf
]

{ #category : #accessing }
MOSelfReference >> type [
 	self error: 'should implement '
]
