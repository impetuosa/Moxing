Extension { #name : #MOLanguage }

{ #category : #'*Moxing-Access' }
MOLanguage class >> microsoftAccessFor: aMOModel [

	^ aMOModel instantiate: MOAccess
]
