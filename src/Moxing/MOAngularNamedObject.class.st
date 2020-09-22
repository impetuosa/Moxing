Class {
	#name : #MOAngularNamedObject,
	#superclass : #MOAngularObject,
	#instVars : [
		'name'
	],
	#category : #'Moxing-Model'
}

{ #category : #accessing }
MOAngularNamedObject >> name [
	^ name
]

{ #category : #accessing }
MOAngularNamedObject >> name: aString [

	name := aString
]
