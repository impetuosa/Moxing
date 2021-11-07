Extension { #name : #FileReference }

{ #category : #'*Moxing' }
FileReference >> asMOAnchor [

	^ MOAnchor new
		  file: self;
		  yourself
]
