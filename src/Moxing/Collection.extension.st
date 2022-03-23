Extension { #name : #Collection }

{ #category : #'*Moxing' }
Collection >> isMOObject [

	^ self anySatisfy: [ :a | a isMOObject ]
]
