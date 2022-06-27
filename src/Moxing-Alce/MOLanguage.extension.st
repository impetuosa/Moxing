Extension { #name : #MOLanguage }

{ #category : #'*Moxing-Alce' }
MOLanguage class >> microsoftAccessFor: aMOModel [

	^ (aMOModel instantiate: self)
		  name: #MicrosoftAccess;
		  yourself
]

{ #category : #'*Moxing-Alce' }
MOLanguage class >> microsoftAccessForAlceModel: anAlcixModel [

	^ self newInstanceFromModel
		  name: #MicrosoftAccess;
		  yourself
]
