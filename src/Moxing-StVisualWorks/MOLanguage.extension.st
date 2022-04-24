Extension { #name : #MOLanguage }

{ #category : #'*Moxing-StVisualWorks' }
MOLanguage class >> html [

	^ html ifNil: [ 
		  html := self newInstanceFromModel
			          name: #Html;
			          yourself ]
]

{ #category : #'*Moxing-StVisualWorks' }
MOLanguage class >> visualWorksFor: aMOModel [
  ^(aMOModel instantiate: self)
     name: #visualworks;
     expressionTypeResolvingStrategy: MOVWExpressionTypeResolver;
     yourself
]
