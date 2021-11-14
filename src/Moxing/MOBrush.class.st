Class {
	#name : #MOBrush,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Moxing-Brushes'
}

{ #category : #accessing }
MOBrush class >> instance [ 
	^ instance ifNil: [  instance := self new. ]
]

{ #category : #writing }
MOBrush >> write: anEntity into: aWriter [
	self subclassResponsibility 
]

{ #category : #writing }
MOBrush >> write: anEntity into: aWriter with: aBlockClosure [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MOBrush >> writesClass [
	^ false 
]

{ #category : #'as yet unclassified' }
MOBrush >> writesInvocableBehaviour [
	^ false 
]

{ #category : #'as yet unclassified' }
MOBrush >> writesType [
	^ false 
]
