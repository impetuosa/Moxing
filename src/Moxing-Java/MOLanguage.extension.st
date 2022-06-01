Extension { #name : #MOLanguage }

{ #category : #'*Moxing-Java' }
MOLanguage class >> javaFor: aMOModel [
  ^(aMOModel instantiate: self)
     name: #java;
     yourself
]
