Class {
	#name : #MOTransientClass,
	#superclass : #MOTransientEntity,
	#instVars : [
		'class',
		'invocables',
		'properties'
	],
	#category : #'Moxing-Angular-TransientModel'
}

{ #category : #visiting }
MOTransientClass >> acceptVisitor: aMOMicrosoftAccessCodeGenerator [

	^ aMOMicrosoftAccessCodeGenerator visitTransientClass: self
]

{ #category : #adding }
MOTransientClass >> addFunction: aMOProcedure [ 
	invocables add: aMOProcedure 
]

{ #category : #adding }
MOTransientClass >> addInvocable: aMOProcedure [ 
	invocables add: aMOProcedure 
]

{ #category : #adding }
MOTransientClass >> addMethod: aMOProcedure [ 
	invocables add: aMOProcedure 
]

{ #category : #adding }
MOTransientClass >> addProperty: anAttribute [ 
	properties add: anAttribute 
]

{ #category : #accessing }
MOTransientClass >> getClass [
	^ class
]

{ #category : #adding }
MOTransientClass >> initialize [

	super initialize.
	properties := OrderedCollection new.
	invocables := OrderedCollection new
]

{ #category : #adding }
MOTransientClass >> invocables [

	^ invocables
]

{ #category : #accessing }
MOTransientClass >> language [
	^ class language
]

{ #category : #generated }
MOTransientClass >> produceCode [

	^ self language newCodeTextWriter produceCodeFor: self
]

{ #category : #adding }
MOTransientClass >> properties [  

	^ properties 
]

{ #category : #initialization }
MOTransientClass >> setClass: anAlcixClass [ 
	class := anAlcixClass 
]
