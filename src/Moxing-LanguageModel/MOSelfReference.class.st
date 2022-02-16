Class {
	#name : #MOSelfReference,
	#superclass : #MOTypedReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOSelfReference >> acceptVisitor: aMOJavaCodeGenerator [

	^ aMOJavaCodeGenerator visitSelfReference: self
]

{ #category : #'as yet unclassified' }
MOSelfReference >> callingClass [

	| p |
	p := parent.
	[ p isType ] whileFalse: [ p := p parent ].
	^ p
]

{ #category : #'as yet unclassified' }
MOSelfReference >> name [

	^ name ifNil: [ name := #self ]
]

{ #category : #accessing }
MOSelfReference >> type [
 	self error: 'should implement '
]
