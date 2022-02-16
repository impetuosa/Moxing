Class {
	#name : #MOProcedure,
	#superclass : #MOInvocable,
	#instVars : [
		'#selector => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOProcedure >> acceptVisitor: aJinInspectorBuilder [
	^ aJinInspectorBuilder visitProcedure: self
]

{ #category : #accessing }
MOProcedure >> printOn: aStream [

	aStream
		nextPutAll: 'Procedure: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString.
]

{ #category : #accessing }
MOProcedure >> selector [
	^ selector
	
]

{ #category : #accessing }
MOProcedure >> selector: aString [

	selector := aString.
	name := aString 
]
