Class {
	#name : #MOAnchor,
	#superclass : #Object,
	#instVars : [
		'file',
		'start',
		'stop'
	],
	#category : #'Moxing-Model'
}

{ #category : #accessing }
MOAnchor >> file: aFile [
	file := aFile 
]

{ #category : #accessing }
MOAnchor >> sourceCode [ 
	 | stream code |
	stream := file readStream.
	stream position: start - 1 . 
	code := stream next: stop- start + 1. 
	stream close. 
	^ code 
]

{ #category : #accessing }
MOAnchor >> start: number [
	 start := number 
]

{ #category : #accessing }
MOAnchor >> stop: number [
	 stop := number 
]
