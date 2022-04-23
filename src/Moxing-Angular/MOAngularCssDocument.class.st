Class {
	#name : #MOAngularCssDocument,
	#superclass : #MOAngularDocument,
	#category : #'Moxing-Angular-Model'
}

{ #category : #accessing }
MOAngularCssDocument >> acceptVisitor: aJinInspectorBuilder [

	^ aJinInspectorBuilder visitAngularCssDocument: self
]

{ #category : #accessing }
MOAngularCssDocument >> name [ 
	^ name, '.CSS'
]

{ #category : #accessing }
MOAngularCssDocument >> printOn: aStream [

	aStream
		nextPutAll: 'AngularCss';
		nextPutAll: '(' , name , ')'
]