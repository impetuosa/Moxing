Class {
	#name : #MOParametrizedTypeReference,
	#superclass : #MOTypeReference,
	#instVars : [
		'#argumentTypeReferences => MOReferenceSlot many'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #'as yet unclassified' }
MOParametrizedTypeReference >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitParametrizedTypeReference: self
]

{ #category : #accessing }
MOParametrizedTypeReference >> argumentTypeReferences [

	^ argumentTypeReferences
]

{ #category : #'as yet unclassified' }
MOParametrizedTypeReference >> argumentTypeReferences: aCollection [ 
	argumentTypeReferences := aCollection 
]

{ #category : #'as yet unclassified' }
MOParametrizedTypeReference >> fullName [

	| conf |
	conf := argumentTypeReferences collect: [ :t | t fullName ].
	conf := ',' join: conf.
	^ parent name , '.' , name , '<' , conf , '>'
]

{ #category : #'as yet unclassified' }
MOParametrizedTypeReference >> isArrayReference [
	^ false 
]
