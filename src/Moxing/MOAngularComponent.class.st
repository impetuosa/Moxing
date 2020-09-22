Class {
	#name : #MOAngularComponent,
	#superclass : #MOAngularContainer,
	#instVars : [
		'name'
	],
	#category : #'Moxing-Model'
}

{ #category : #visiting }
MOAngularComponent >> acceptVisitor: aJinInspectorBuilder [

	aJinInspectorBuilder visitAngularComponent: self
]

{ #category : #accessing }
MOAngularComponent >> behavior [

	^ MOAngularComponentBehaviour new
		  path: path / (name , '.component.ts');
		  name: name;
		  yourself
]

{ #category : #accessing }
MOAngularComponent >> name [
	^ name
]

{ #category : #accessing }
MOAngularComponent >> name: aString [ 
	name := aString
]

{ #category : #generated }
MOAngularComponent >> template [

	^ MOAngularComponentTemplate new 
		  path: path / (name , '.component.html ');
		  name: name;
		  yourself
]
