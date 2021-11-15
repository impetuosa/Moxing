Class {
	#name : #MOBrush,
	#superclass : #Object,
	#instVars : [
		'policyTransformationMapping'
	],
	#category : #'Moxing-Brushes'
}

{ #category : #'as yet unclassified' }
MOBrush class >> writesClass [
	^ false 
]

{ #category : #'as yet unclassified' }
MOBrush class >> writesInvocableBehaviour [
	^ false 
]

{ #category : #'as yet unclassified' }
MOBrush class >> writesType [
	^ false 
]

{ #category : #accessing }
MOBrush >> policyTransformationMapping: aCollection [ 
	policyTransformationMapping := aCollection
]

{ #category : #writing }
MOBrush >> write: anEntity into: aWriter [
	self subclassResponsibility 
]

{ #category : #writing }
MOBrush >> write: anEntity into: aWriter with: aBlockClosure [
	self subclassResponsibility 
]
