Class {
	#name : #MOTypescriptMethod,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'value',
		'parameters',
		'selector',
		'class',
		'type'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #visiting }
MOTypescriptMethod >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTypescriptMethod: self 
]

{ #category : #adding }
MOTypescriptMethod >> addParameter: aJinVariable [ 
	parameters add: aJinVariable 
]

{ #category : #accessing }
MOTypescriptMethod >> initialize [

	super initialize.
	parameters := OrderedCollection new
	
]

{ #category : #accessing }
MOTypescriptMethod >> parameters [
	^ parameters
]

{ #category : #accessing }
MOTypescriptMethod >> selector [
	^ selector
	
]

{ #category : #accessing }
MOTypescriptMethod >> selector: aString [

	selector := aString.
	name := aString 
]

{ #category : #accessing }
MOTypescriptMethod >> setOwnerClass: aClassObject [ 
	class := aClassObject 
	
]

{ #category : #generated }
MOTypescriptMethod >> type: aJinTypescriptTypeReference [ 
	type := aJinTypescriptTypeReference 
	
]
