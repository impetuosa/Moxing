Class {
	#name : #MOAngularProtoComponentBehavior,
	#superclass : #Object,
	#instVars : [
		'angularModel'
	],
	#category : #Moxing
}

{ #category : #accessing }
MOAngularProtoComponentBehavior >> acceptVisitor: aJinViewportPageBuilder [

	aJinViewportPageBuilder visitAngularProtoComponentBehavior: self
]

{ #category : #accessing }
MOAngularProtoComponentBehavior >> angularModel: aTypescriptClass [
	angularModel := aTypescriptClass 
]

{ #category : #generated }
MOAngularProtoComponentBehavior >> interfaces [
	^ angularModel types 
]

{ #category : #accessing }
MOAngularProtoComponentBehavior >> methods [
	^ angularModel methods 
]

{ #category : #accessing }
MOAngularProtoComponentBehavior >> name [
	^ 'Behavior'
]

{ #category : #accessing }
MOAngularProtoComponentBehavior >> properties [
	^ angularModel properties 
]

{ #category : #accessing }
MOAngularProtoComponentBehavior >> sourceCode [

	^ angularModel sourceCode
]

{ #category : #accessing }
MOAngularProtoComponentBehavior >> superclass [

	^ angularModel superclass
]
