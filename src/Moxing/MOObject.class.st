Class {
	#name : #MOObject,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MOObject class >> new [
	^ self error: 'must give model'
]

{ #category : #'instance creation' }
MOObject class >> newFromModel [
	^ super model 
]

{ #category : #'instance creation' }
MOObject class >> newInstanceFromModel [ 
	^ super new
]

{ #category : #accessing }
MOObject >> acceptVisitor: aVisitor [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MOObject >> hierarchicalChildren [
	self subclassResponsibility 
]

{ #category : #accessing }
MOObject >> parent [
	^ parent
]

{ #category : #accessing }
MOObject >> parent: aParent [
	parent := aParent.
]
