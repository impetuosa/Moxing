Class {
	#name : #MOProcedure,
	#superclass : #MOInvocable,
	#instVars : [
		'selector'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOProcedure >> acceptVisitor: aJinInspectorBuilder [
	^ aJinInspectorBuilder visitProcedure: self
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
