Class {
	#name : #MessageSendBasedChunk,
	#superclass : #CodeChunk,
	#instVars : [
		'name',
		'state',
		'kind',
		'node',
		'nodes',
		'isPreexisting'
	],
	#category : #'Moxing-StVisualWorks-CodeImport'
}

{ #category : #accessing }
MessageSendBasedChunk >> addNode: aRBMessageNode [

	nodes add: aRBMessageNode
]

{ #category : #accessing }
MessageSendBasedChunk >> at: aString or: anUndefinedObject [

	^ self state at: aString ifAbsent: [ anUndefinedObject ]
]

{ #category : #accessing }
MessageSendBasedChunk >> contents: aContents [

	contents add: aContents
]

{ #category : #accessing }
MessageSendBasedChunk >> initialize [ 
	super initialize. 
	nodes := OrderedCollection new.
	contents := OrderedCollection new
]

{ #category : #accessing }
MessageSendBasedChunk >> isPreexisting [

	^ isPreexisting ifNil: [ isPreexisting := false ]
]

{ #category : #accessing }
MessageSendBasedChunk >> isPreexisting: aval [

	isPreexisting := aval
]

{ #category : #accessing }
MessageSendBasedChunk >> kind [
	^ kind
]

{ #category : #accessing }
MessageSendBasedChunk >> kind: aString [

	kind := aString
]

{ #category : #accessing }
MessageSendBasedChunk >> name [
	^ name
]

{ #category : #accessing }
MessageSendBasedChunk >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MessageSendBasedChunk >> node: aRBMessageNode [

	node := aRBMessageNode
]

{ #category : #accessing }
MessageSendBasedChunk >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: self name;
		nextPutAll: ')'
]

{ #category : #accessing }
MessageSendBasedChunk >> state [
	^ state ifNil: [ state := Dictionary new  ]
]
