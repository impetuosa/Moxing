Class {
	#name : #MOArtefact,
	#superclass : #MONamedDeclaration,
	#instVars : [
		'#types => MODeclaresSlot many',
		'#declarationUnits => MODeclaresSlot many',
		'#packages => MODeclaresSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOArtefact >> allTypes [
	 ^ types , (declarationUnits flatCollect: #types )
]

{ #category : #testing }
MOArtefact >> canBeReferredAsArtefact [

	^ true
]

{ #category : #accessing }
MOArtefact >> childrenForTree [

	^ self allContainments sort: #printString ascending
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
MOArtefact >> isArtefact [

	^ true
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
MOArtefact >> types [
	^ types
]

{ #category : #accessing }
MOArtefact >> types: aCollection [ 
	types := aCollection
]
