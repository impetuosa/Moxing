Class {
	#name : #MODefaultModelReader,
	#superclass : #MOModelReader,
	#category : #'Moxing-Reader'
}

{ #category : #accessing }
MODefaultModelReader >> read: anEntity [

	| relation |
	relation := anEntity parent allRelations select: [ :rel | 
		            rel to = anEntity ].
	self assert: relation size = 1.
	relation := relation first.

	read := relation shallowCopy.
	read 
		from: (writer shallowCopy: relation from)
		to: (writer shallowCopy: relation to).

	^ read := read to
]
