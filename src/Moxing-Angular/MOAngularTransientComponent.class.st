Class {
	#name : #MOAngularTransientComponent,
	#superclass : #MOTransientEntity,
	#instVars : [
		'module',
		'template',
		'behaviour',
		'name'
	],
	#category : #'Moxing-Angular-TransientModel'
}

{ #category : #visiting }
MOAngularTransientComponent >> acceptVisitor: aVisitor [
	aVisitor visitAngularProtoComponent: self . 
	
]

{ #category : #accessing }
MOAngularTransientComponent >> behavior [
	^ behaviour
		ifNil: [ behaviour := MOAngularTransientComponentBehavior new ]
]

{ #category : #accessing }
MOAngularTransientComponent >> behavior: aJinTypescriptClass [
	behaviour := aJinTypescriptClass
]

{ #category : #accessing }
MOAngularTransientComponent >> module: aModule [
	module := aModule
]

{ #category : #accessing }
MOAngularTransientComponent >> name [
	^ name
]

{ #category : #accessing }
MOAngularTransientComponent >> name: aString [
	name := aString
]

{ #category : #accessing }
MOAngularTransientComponent >> printOn: aStream [
	aStream
		nextPutAll: 'AngComponent(';
		nextPutAll: name;
		nextPutAll: ')'
]

{ #category : #actions }
MOAngularTransientComponent >> save [
	| ref |
	self assert: (module components includes: self).
	ref := module path / ('{1}.component.ts' format: {name}).
	self assert: ref exists not.
	ref writeStream
		nextPutAll: behaviour sourceCode;
		close.
	ref := module path / ('{1}.component.html' format: {name}).
	self assert: ref exists not.
	ref writeStream
		nextPutAll: template sourceCode;
		close.
	module components remove: self
]

{ #category : #accessing }
MOAngularTransientComponent >> template [
	^ template
]

{ #category : #accessing }
MOAngularTransientComponent >> template: aJinAngularProtoComponentTemplate [ 
	template := aJinAngularProtoComponentTemplate
]
