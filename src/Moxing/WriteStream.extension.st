Extension { #name : #WriteStream }

{ #category : #'*Moxing' }
WriteStream >> newLine [
	^ self nextPutAll:  OSPlatform current lineEnding
]
