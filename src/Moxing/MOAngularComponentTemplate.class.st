Class {
	#name : #MOAngularComponentTemplate,
	#superclass : #MOAngularNamedObject,
	#category : #'Moxing-Model'
}

{ #category : #visiting }
MOAngularComponentTemplate >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularComponentTemplate: self 
]

{ #category : #accessing }
MOAngularComponentTemplate >> ast [

	^ XMLHTMLParser parse: path readStream
]

{ #category : #accessing }
MOAngularComponentTemplate >> name [ 
	^ 'Template'
]

{ #category : #accessing }
MOAngularComponentTemplate >> sourceCode [
	^ path readStream upToEnd. 
]
