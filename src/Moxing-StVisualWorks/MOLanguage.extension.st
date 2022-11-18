Extension { #name : #MOLanguage }

{ #category : #'*Moxing-StVisualWorks' }
MOLanguage class >> html [

	^ html ifNil: [ html := MOHtml newInstanceFromModel yourself ]
]

{ #category : #'*Moxing-StVisualWorks' }
MOLanguage class >> visualWorksFor: aMOModel [

	^ aMOModel instantiate: MOVisualWorks
]
