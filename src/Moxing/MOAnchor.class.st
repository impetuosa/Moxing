"
I am an Anchor that mixes kind of entry and entry name.
"
Class {
	#name : #MOAnchor,
	#superclass : #Object,
	#instVars : [
		'path',
		'to',
		'from'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MOAnchor class >> on: aString [
	^ self new privateSetPath: (AbsolutePath from: aString)
]

{ #category : #arithmetic }
MOAnchor >> / aString [
	| new fragment |
	new := self class new.
	fragment := self scapeSlash: (aString adaptToAlceAnchorPathFragment) .
	new privateSetPath: path / fragment. 
	^ new 
]

{ #category : #arithmetic }
MOAnchor >> containsSource [

	^ path segments includes: '@src'
]

{ #category : #'instance creation' }
MOAnchor >> from: aFrom to: aTo [

	from := aFrom.
	to := aTo
]

{ #category : #testing }
MOAnchor >> isRoot [

	^ path isRoot
]

{ #category : #arithmetic }
MOAnchor >> names [

	self containsSource ifTrue: [ 
		^ (1 to: (path segments indexOf: '@src') by: 2) collect: [ :i | 
			  path at: i ] ].
	^ (1 to: path segments size by: 2) collect: [ :i | path at: i ]
]

{ #category : #accessing }
MOAnchor >> parent [

	| new fragment |
	new := self class new.
	new privateSetPath: path parent.
	^ new
]

{ #category : #'as yet unclassified' }
MOAnchor >> pathIsNotSet [

	^ path isNil
]

{ #category : #arithmetic }
MOAnchor >> printOn: aStream [

	aStream
		nextPutAll: 'anchor(/';
		nextPutAll: ('/' join: path segments);
		nextPutAll: ')'
]

{ #category : #arithmetic }
MOAnchor >> privateSetPath: aPath [
	path := aPath
]

{ #category : #properties }
MOAnchor >> readStream: file [

	^ (self sourceCode: file) readStream
]

{ #category : #arithmetic }
MOAnchor >> scapeSlash: fragment [

	^ fragment copyReplaceAll: '/' with: '^'
]

{ #category : #accessing }
MOAnchor >> sourceCode: file [

	| stream code |
	stream := file readStream.
	stream position: from - 1.
	code := stream next: to - from + 1.
	stream close.
	^ code
]

{ #category : #arithmetic }
MOAnchor >> srcFrom [

	^ from
]

{ #category : #arithmetic }
MOAnchor >> srcTo [

	^ to
]
