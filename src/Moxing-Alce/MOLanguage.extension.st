Extension { #name : #MOLanguage }

{ #category : #'*Moxing-Alce' }
MOLanguage class >> microsoftAccessFor: aMOModel [

	^ aMOModel instantiate: MOAccess
]
