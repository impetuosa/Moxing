Class {
	#name : #MOAngularComponent,
	#superclass : #MOAngularEntry,
	#instVars : [
		'behavior',
		'template'
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
