Extension { #name : #AlcixEntity }

{ #category : #'*Moxing' }
AlcixEntity >> language [

	^ MOLanguage microsoftAccessForAlceModel: mooseModel 
]
