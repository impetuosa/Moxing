Extension { #name : #FamixTIndexedFileNavigation }

{ #category : #'*Moxing-Java' }
FamixTIndexedFileNavigation >> fullSourceText [
	self sourcesAreReadable ifFalse: [ ^ '' ].
	

	
	^ self fileReference
		binaryReadStreamDo: [ :in | 
			| stream |
			stream := ZnCharacterReadStream on: in encoding: self encoding.
			stream upToEnd ]
]
