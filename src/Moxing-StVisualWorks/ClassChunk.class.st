Class {
	#name : #ClassChunk,
	#superclass : #MessageSendBasedChunk,
	#instVars : [
		'comment',
		'methods',
		'sharedVariables'
	],
	#category : #'Moxing-StVisualWorks-CodeImport'
}

{ #category : #accessing }
ClassChunk >> accept: aVisitor [

	^ aVisitor visitClassChunk: self
]

{ #category : #adding }
ClassChunk >> addMethodChunk: aMethodChunk [

	^ methods add: aMethodChunk
]

{ #category : #adding }
ClassChunk >> addSharedVariable: aSharedVariableChunk [

	^ self sharedVariables add: aSharedVariableChunk
]

{ #category : #accessing }
ClassChunk >> category [

	^ state at: #category ifAbsent: [ 'none' ]
]

{ #category : #'private - backend access' }
ClassChunk >> classVariables [

	^ (' ' split: (self at: #classInstanceVariables or: '')) reject:
		  #isEmpty
]

{ #category : #accessing }
ClassChunk >> comment [
	^ comment
]

{ #category : #accessing }
ClassChunk >> comment: aString [ 
	comment := aString
]

{ #category : #adding }
ClassChunk >> initialize [

	super initialize.
	methods := OrderedCollection new
]

{ #category : #accessing }
ClassChunk >> instanceVariables [

	^ (' ' split: (self at: #instanceVariables or: '')) reject: #isEmpty
]

{ #category : #accessing }
ClassChunk >> methods [
	^ methods
]

{ #category : #accessing }
ClassChunk >> packageName [

	^ self at: #packageName or: nil
]

{ #category : #accessing }
ClassChunk >> sharedVariables [

	^ sharedVariables ifNil: [ sharedVariables := OrderedCollection new ]
]

{ #category : #accessing }
ClassChunk >> superclass [

	^ self at: #superclass or: #none
]

{ #category : #accessing }
ClassChunk >> symbolKind [

	^ #Class
]
