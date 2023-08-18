Extension { #name : #UndefinedSlot }

{ #category : #'*Moxing' }
UndefinedSlot >> slotClassName [

	^ (ast arguments first isMessage
		   ifTrue: [ ast arguments first receiver ]
		   ifFalse: [ ast arguments first variable ]) name
]
