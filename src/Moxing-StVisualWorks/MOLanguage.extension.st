Extension { #name : #MOLanguage }

{ #category : #'*Moxing-StVisualWorks' }
MOLanguage class >> visualWorksFor: aMOModel [
  ^(aMOModel instantiate: self)
     name: #visualworks;
     expressionTypeResolvingStrategy: MOVWExpressionTypeResolver;
     yourself
]
