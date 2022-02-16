Class {
	#name : #MOAnchoredObject,
	#superclass : #MONamedObject,
	#instVars : [
		'#anchor => MOPropertySlot',
		'#fileReference => MOPropertySlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOAnchoredObject >> anchor [

	^ anchor 
]

{ #category : #accessing }
MOAnchoredObject >> anchor: aMOAnchor [

	(anchor isNotNil and: [ anchor pathIsNotSet ]) ifTrue: [ 
		aMOAnchor from: anchor srcFrom to: anchor srcTo ].
	anchor := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOAnchoredObject >> anchorFrom: from to: to [

	(anchor ifNil: [ anchor := MOAnchor new ]) from: from to: to
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
MOAnchoredObject >> mapSpaceAnchor [
	^ anchor
]

{ #category : #accessing }
MOAnchoredObject >> mustBeSaved [
	^ false
]
