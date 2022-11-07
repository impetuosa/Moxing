Extension { #name : #MOLanguage }

{ #category : #'*Moxing-StPharo' }
MOLanguage class >> pharoFor: aMOModel [

	^ aMOModel instantiate: MOPharo
]
