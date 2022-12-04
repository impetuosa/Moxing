Class {
	#name : #MOAngularComponent,
	#superclass : #MOLanguageConstruct,
	#instVars : [
		'#name => MOPropertySlot',
		'#behavior => MODeclaresSlot one',
		'#template => MODeclaresSlot one',
		'#css => MODeclaresSlot one'
	],
	#category : #'Moxing-Angular-Declaration'
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

	^parent isDefinedInLibrary
]

{ #category : #generated }
MOAngularComponent >> name [

	^ name
]

{ #category : #generated }
MOAngularComponent >> name: aName [ 
	 name := aName 
	
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
