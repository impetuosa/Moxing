Class {
	#name : #MOAngularTemplateDocument,
	#superclass : #MOAngularDocument,
	#category : #'Moxing-Angular-Model'
}

{ #category : #printing }
MOAngularTemplateDocument >> acceptVisitor: aJinInspectorBuilder [ 
	^ aJinInspectorBuilder visitAngularTemplateDocument: self 
]

{ #category : #accessing }
MOAngularTemplateDocument >> ast [

	^ XMLHTMLParser parse: document
]

{ #category : #accessing }
MOAngularTemplateDocument >> language [

	^ MOLanguage html
]

{ #category : #printing }
MOAngularTemplateDocument >> printOn: aStream [

	aStream
		nextPutAll: 'AngularTemplate';
		nextPutAll: '(' , name , ')'
]
