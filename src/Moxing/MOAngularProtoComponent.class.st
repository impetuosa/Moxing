Class {
	#name : #MOAngularProtoComponent,
	#superclass : #MOAngularProtoEntity,
	#instVars : [
		'module',
		'template',
		'behaviour',
		'name'
	],
	#category : #'Moxing-ProtoModel'
}

{ #category : #visiting }
MOAngularProtoComponent >> acceptVisitor: aVisitor [
	aVisitor visitAngularProtoComponent: self . 
	
]

{ #category : #accessing }
MOAngularProtoComponent >> behavior [
	^ behaviour
		ifNil: [ behaviour := MOAngularProtoComponentBehavior new ]
]

{ #category : #accessing }
MOAngularProtoComponent >> behavior: aJinTypescriptClass [
	behaviour := aJinTypescriptClass
]

{ #category : #accessing }
MOAngularProtoComponent >> module: aModule [
	module := aModule
]

{ #category : #accessing }
MOAngularProtoComponent >> name [
	^ name
]

{ #category : #accessing }
MOAngularProtoComponent >> name: aString [
	name := aString
]

{ #category : #accessing }
MOAngularProtoComponent >> printOn: aStream [
	aStream
		nextPutAll: 'AngComponent(';
		nextPutAll: name;
		nextPutAll: ')'
]

{ #category : #actions }
MOAngularProtoComponent >> save [
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
MOAngularProtoComponent >> template [
	^ template
]

{ #category : #accessing }
MOAngularProtoComponent >> template: aJinAngularProtoComponentTemplate [ 
	template := aJinAngularProtoComponentTemplate
]
