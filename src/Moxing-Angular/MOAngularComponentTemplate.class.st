Class {
	#name : #MOAngularComponentTemplate,
	#superclass : #MOAnchoredDeclaration,
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularComponentTemplate >> acceptVisitor: aJinInspectorBuilder [ 
	^ aJinInspectorBuilder visitAngularComponentTemplate: self 
]

{ #category : #accessing }
MOAngularComponentTemplate >> ast [

	^ XMLHTMLParser parse: anchor readStream
]

{ #category : #accessing }
MOAngularComponentTemplate >> name [ 
	^ 'Template'
]

{ #category : #accessing }
MOAngularComponentTemplate >> printOn: aStream [

	aStream nextPutAll: 'AngularTemplate(' , name , ')'
]

{ #category : #accessing }
MOAngularComponentTemplate >> sourceCode [

	^ anchor readStream upToEnd
]
