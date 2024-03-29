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
MOProcedure >> canBeReferredAsFunction [
	 ^ true
]

{ #category : #accessing }
MOProcedure >> isProcedure [

	^ true
]

{ #category : #accessing }
MOProcedure >> name [

	^ selector
]

{ #category : #accessing }
MOProcedure >> name: aSelector [

	selector := aSelector
]

{ #category : #accessing }
MOProcedure >> printOn: aStream [

	aStream
		nextPutAll: (parent ifNil: [ 'NoName' ] ifNotNil: [ parent name ]);
		nextPutAll: '>>';
		nextPutAll: 'Procedure: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString
]

{ #category : #accessing }
MOProcedure >> selector [
	^ selector
	
]

{ #category : #accessing }
MOProcedure >> selector: aString [

	selector := aString.
	self name: aString 
]
