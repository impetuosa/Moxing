Class {
	#name : #MOJavaModelReader,
	#superclass : #MOModelReader,
	#category : #'Moxing-Java-Writer'
}

{ #category : #'meta-object-protocol' }
MOJavaModelReader >> read: anEntity [

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
