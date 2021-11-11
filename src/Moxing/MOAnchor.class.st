Class {
	#name : #MOAnchor,
	#superclass : #Object,
	#instVars : [
		'path',
		'start',
		'stop'
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

{ #category : #arithmetic }
MOAnchor >> printOn: aStream [

	aStream nextPutAll: 'anchor('.
	path printOn: aStream.
	aStream nextPutAll: ')'
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
	stream position: start - 1.
	code := stream next: stop - start + 1.
	stream close.
	^ code
]

{ #category : #arithmetic }
MOAnchor >> srcFrom [

	^ self containsSource
		  ifTrue: [ 
			  (path segments reverse at:
				   (path segments reverse indexOf: '@src') - 1) asNumber ]
		  ifFalse: [ -1 ]
]

{ #category : #arithmetic }
MOAnchor >> srcTo [

	^ (path segments reverse at: (path segments reverse indexOf: #to) - 1)
		  asNumber
]
