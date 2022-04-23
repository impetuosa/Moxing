Extension { #name : #MOLanguage }

{ #category : #'*Moxing-Typescript' }
MOLanguage class >> typescriptFor: aMOModel [

	^ (aMOModel instantiate: self)
		  name: #typescript;
		  yourself
]
