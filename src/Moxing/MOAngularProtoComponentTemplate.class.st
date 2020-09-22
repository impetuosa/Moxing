Class {
	#name : #MOAngularProtoComponentTemplate,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #Moxing
}

{ #category : #visiting }
MOAngularProtoComponentTemplate >> acceptVisitor: aJinViewportPageBuilder [

	aJinViewportPageBuilder visitAngularProtoComponentTemplate: self
]

{ #category : #accessing }
MOAngularProtoComponentTemplate >> ast [
	^ XMLHTMLParser parse: contents
]

{ #category : #accessing }
MOAngularProtoComponentTemplate >> contents: aString [ 
	contents := aString
]

{ #category : #accessing }
MOAngularProtoComponentTemplate >> name [
	^ 'Template'
]

{ #category : #accessing }
MOAngularProtoComponentTemplate >> sourceCode [

	^ contents
]
