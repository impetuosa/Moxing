Extension { #name : #MOLanguage }

{ #category : #'*Moxing-AngularJS' }
MOLanguage class >> angularJsFor: aMOModel [

	^ aMOModel instantiate: MOAngularJsTypeScript
]
