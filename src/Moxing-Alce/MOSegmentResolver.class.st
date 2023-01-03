Class {
	#name : #MOSegmentResolver,
	#superclass : #Object,
	#instVars : [
		'segments',
		'traversed'
	],
	#category : #'Moxing-Alce'
}

{ #category : #'as yet unclassified' }
MOSegmentResolver >> resolveSegmentsFor: aJinDAMMemberReference [

	segments := OrderedCollection new.
	traversed := Set new.
	aJinDAMMemberReference acceptVisitor: self.

	^ segments reversed
]

{ #category : #visiting }
MOSegmentResolver >> visitAccessRead: aJinDAMAccessRead [

	(traversed includes: aJinDAMAccessRead) ifTrue: [ ^ self ].
	traversed add: aJinDAMAccessRead.
	aJinDAMAccessRead readReference acceptVisitor: self
]

{ #category : #visiting }
MOSegmentResolver >> visitAccessWrite: aJinDAMAccessWrite [

	(traversed includes: aJinDAMAccessWrite) ifTrue: [ ^ self ].
	traversed add: aJinDAMAccessWrite
]

{ #category : #visiting }
MOSegmentResolver >> visitLibraryReference: aJinDAMLibraryReference [

	(traversed includes: aJinDAMLibraryReference) ifTrue: [ ^ self ].
	traversed add: aJinDAMLibraryReference.
	segments add: aJinDAMLibraryReference
]

{ #category : #visiting }
MOSegmentResolver >> visitMemberReference: aJinDAMMemberReference [

	(traversed includes: aJinDAMMemberReference) ifTrue: [ ^ self ].
	traversed add: aJinDAMMemberReference.
	segments add: aJinDAMMemberReference.
	aJinDAMMemberReference context acceptVisitor: self
]

{ #category : #visiting }
MOSegmentResolver >> visitNewExpression: aJinDAMNewExpression [

	(traversed includes: aJinDAMNewExpression) ifTrue: [ ^ self ].
	traversed add: aJinDAMNewExpression.
	segments add: aJinDAMNewExpression.

]

{ #category : #visiting }
MOSegmentResolver >> visitTypeMemberReference: aJinDAMTypeMemberReference [

	(traversed includes: aJinDAMTypeMemberReference) ifTrue: [ ^ self ].
	traversed add: aJinDAMTypeMemberReference.
	segments add: aJinDAMTypeMemberReference.
	aJinDAMTypeMemberReference context acceptVisitor: self
]

{ #category : #visiting }
MOSegmentResolver >> visitTypeReference: aJinDAMTypeReference [

	^ self visitMemberReference: aJinDAMTypeReference
]
