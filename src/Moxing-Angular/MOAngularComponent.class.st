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

{ #category : #generated }
MOAngularComponent >> containsSourceCodeEntities [

	^ true
]

{ #category : #accessing }
MOAngularComponent >> css [
	^ css
]

{ #category : #accessing }
MOAngularComponent >> css: aMOAngularDocument [ 
	css := aMOAngularDocument
]

{ #category : #testing }
MOAngularComponent >> isAngularComponent [

	^ true
]

{ #category : #generated }
MOAngularComponent >> isDeclaration [

	^ true
]

{ #category : #testing }
MOAngularComponent >> isDefinedInLibrary [

	^ behavior isDefinedInLibrary
]

{ #category : #generated }
MOAngularComponent >> printOn: aStream [

	aStream
		nextPutAll: 'AngularComponent: ';
		print:self  name
]

{ #category : #generated }
MOAngularComponent >> template [
	^ template 
]

{ #category : #generated }
MOAngularComponent >> template: tm [

	template := tm
]
