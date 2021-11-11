Class {
	#name : #MOAnchoredObject,
	#superclass : #MONamedObject,
	#instVars : [
		'anchor',
		'fileReference'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOAnchoredObject >> anchor [

	^ anchor 
]

{ #category : #accessing }
MOAnchoredObject >> anchor: aMOAnchor [ 
	anchor := aMOAnchor
]

{ #category : #accessing }
MOAnchoredObject >> anchorSelectorName [
	^( self class name copyReplaceAll: 'MO' with: '') asLowercase 
]

{ #category : #accessing }
MOAnchoredObject >> calculateAnchorIfMissing [

	^ anchor ifNil: [ 
		  parent calculateAnchorIfMissing / self anchorSelectorName / self name ]
]

{ #category : #accessing }
MOAnchoredObject >> fileReference [
	^ fileReference
]

{ #category : #accessing }
MOAnchoredObject >> fileReference: aFileReference [

	fileReference := aFileReference
]

{ #category : #accessing }
MOAnchoredObject >> installCalculatedAnchorIfMissing [

	anchor ifNil: [ anchor := self calculateAnchorIfMissing ]
]

{ #category : #accessing }
MOAnchoredObject >> mustBeSaved [
	^ false
]
