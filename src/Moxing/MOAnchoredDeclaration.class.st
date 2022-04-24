Class {
	#name : #MOAnchoredDeclaration,
	#superclass : #MONamedDeclaration,
	#instVars : [
		'#anchor => MOPropertySlot',
		'#fileReference => MOPropertySlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOAnchoredDeclaration >> anchor [

	^ anchor 
]

{ #category : #accessing }
MOAnchoredDeclaration >> anchor: aMOAnchor [

	(anchor isNotNil and: [ anchor pathIsNotSet ]) ifTrue: [ 
		aMOAnchor from: anchor srcFrom to: anchor srcTo ].
	anchor := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOAnchoredDeclaration >> anchorFrom: from to: to [

	(anchor ifNil: [ anchor := MOAnchor new ]) from: from to: to
]

{ #category : #accessing }
MOAnchoredDeclaration >> anchorSelectorName [
	^( self class name copyReplaceAll: 'MO' with: '') asLowercase 
]

{ #category : #accessing }
MOAnchoredDeclaration >> calculateAnchorIfMissing [

	^ anchor ifNil: [ 
		  parent calculateAnchorIfMissing / self anchorSelectorName / self name ]
]

{ #category : #accessing }
MOAnchoredDeclaration >> fileReference [
	^ fileReference
]

{ #category : #accessing }
MOAnchoredDeclaration >> fileReference: aFileReference [

	fileReference := aFileReference
]

{ #category : #accessing }
MOAnchoredDeclaration >> installCalculatedAnchorIfMissing [

	anchor ifNil: [ anchor := self calculateAnchorIfMissing ]
]

{ #category : #accessing }
MOAnchoredDeclaration >> mapSpaceAnchor [
	^ anchor
]

{ #category : #accessing }
MOAnchoredDeclaration >> mustBeSaved [
	^ false
]
