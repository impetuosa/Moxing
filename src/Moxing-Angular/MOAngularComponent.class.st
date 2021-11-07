Class {
	#name : #MOAngularComponent,
	#superclass : #MOAngularContainer,
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularComponent >> acceptVisitor: aJinInspectorBuilder [

	aJinInspectorBuilder visitAngularComponent: self
]

{ #category : #accessing }
MOAngularComponent >> behavior [

	^ MOAngularComponentBehaviour new
		  anchor: anchor / (name , '.component.ts');
		  name: name;
		  yourself
]

{ #category : #generated }
MOAngularComponent >> template [
	^ MOAngularComponentTemplate new 
		  anchor: anchor / (name , '.component.html ');
		  name: name;
		  yourself
]
