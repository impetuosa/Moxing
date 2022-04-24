Class {
	#name : #MOAngularTransientComponentBehavior,
	#superclass : #MOTransientEntity,
	#instVars : [
		'angularModel'
	],
	#category : #'Moxing-Angular-TransientModel'
}

{ #category : #accessing }
MOAngularTransientComponentBehavior >> acceptVisitor: aJinViewportPageBuilder [
	aJinViewportPageBuilder visitAngularProtoComponentBehavior: self
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> angularModel [
	^ angularModel
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> angularModel: aTypescriptClass [
	angularModel := aTypescriptClass 
]

{ #category : #generated }
MOAngularTransientComponentBehavior >> interfaces [
	^ angularModel types 
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> methods [
	^ angularModel methods 
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> name [
	^ 'Behavior'
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> printOn: aStream [
	aStream
		nextPutAll: 'AngComponentBehaviour(';
		nextPutAll: angularModel name;
		nextPutAll: ')'
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> properties [
	^ angularModel properties 
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> sourceCode [
	^ angularModel sourceCode
]

{ #category : #accessing }
MOAngularTransientComponentBehavior >> superclass [
	^ angularModel superclass
]
