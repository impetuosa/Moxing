Class {
	#name : #MOAngularComponent,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#behavior => MOContainmentSlot one',
		'#template => MOContainmentSlot one',
		'#css => MOContainmentSlot one'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularComponent >> acceptVisitor: aJinInspectorBuilder [

	^ aJinInspectorBuilder visitAngularComponent: self
]

{ #category : #accessing }
MOAngularComponent >> behavior [

	^ behavior
]

{ #category : #accessing }
MOAngularComponent >> behavior: ab [

	^ behavior := ab
]

{ #category : #accessing }
MOAngularComponent >> css: aMOAngularDocument [ 
	css := aMOAngularDocument
]

{ #category : #generated }
MOAngularComponent >> printOn: aStream [

	aStream
		nextPutAll: 'AngularComponent: ';
		nextPutAll: name
]

{ #category : #generated }
MOAngularComponent >> template [
	^ template 
]

{ #category : #generated }
MOAngularComponent >> template: tm [

	template := tm
]
