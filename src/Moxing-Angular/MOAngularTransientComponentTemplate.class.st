Class {
	#name : #MOAngularTransientComponentTemplate,
	#superclass : #MOTransientEntity,
	#instVars : [
		'contents'
	],
	#category : #'Moxing-Angular-TransientModel'
}

{ #category : #visiting }
MOAngularTransientComponentTemplate >> acceptVisitor: aJinViewportPageBuilder [
	aJinViewportPageBuilder visitAngularProtoComponentTemplate: self
]

{ #category : #accessing }
MOAngularTransientComponentTemplate >> ast [
	^ XMLHTMLParser parse: contents
]

{ #category : #accessing }
MOAngularTransientComponentTemplate >> contents: aString [ 
	contents := aString
]

{ #category : #accessing }
MOAngularTransientComponentTemplate >> name [
	^ 'Template'
]

{ #category : #accessing }
MOAngularTransientComponentTemplate >> sourceCode [

	^ contents
]
