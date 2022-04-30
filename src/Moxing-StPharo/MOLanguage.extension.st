Extension { #name : #MOLanguage }

{ #category : #'*Moxing-StPharo' }
MOLanguage class >> pharoFor: aMOModel [
  ^(aMOModel instantiate: self)
     name: #pharo;
     expressionTypeResolvingStrategy: MOPhExpressionTypeResolver;
     yourself
]
