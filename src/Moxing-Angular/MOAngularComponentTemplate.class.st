Class {
	#name : #MOAngularComponentTemplate,
	#superclass : #MOObject,
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularComponentTemplate >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularComponentTemplate: self 
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
MOAngularComponentTemplate >> sourceCode [
	^ anchor readStream upToEnd. 
]
