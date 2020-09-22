Class {
	#name : #MOAngularContainer,
	#superclass : #MOAngularObject,
	#instVars : [
		'entities'
	],
	#category : #'Moxing-Model'
}

{ #category : #accessing }
MOAngularContainer >> privateGetEntities [

	^ self subclassResponsibility
]
