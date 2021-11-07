Class {
	#name : #MOAngularContainer,
	#superclass : #MOObject,
	#instVars : [
		'entities'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #accessing }
MOAngularContainer >> privateGetEntities [

	^ self subclassResponsibility
]
