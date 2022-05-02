Class {
	#name : #MOArtefact,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#types => MOContainmentSlot many',
		'#declarationUnits => MOContainmentSlot many',
		'#packages => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOArtefact >> allTypes [
	 ^ types , (declarationUnits flatCollect: #types )
]

{ #category : #accessing }
MOArtefact >> declarationUnits [
	^ declarationUnits
]

{ #category : #accessing }
MOArtefact >> declarationUnits: aCollection [

	declarationUnits := aCollection
]

{ #category : #accessing }
MOArtefact >> isDeclaration [

	^ true
]

{ #category : #accessing }
MOArtefact >> packages: aCollection [ 
	packages := aCollection
]

{ #category : #accessing }
MOArtefact >> types: aCollection [ 
	types := aCollection
]
