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

{ #category : #printing }
MOAngularTemplateDocument >> name [

	^( name ifNil: [ 'template' ] ), '.HTML'
]

{ #category : #printing }
MOAngularTemplateDocument >> printOn: aStream [

	aStream
		nextPutAll: 'AngularTemplate';
		nextPutAll: '(' , name , ')'
]
