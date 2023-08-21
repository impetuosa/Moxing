"
Alce Form. I represent a Form. 

"
Class {
	#name : #MOAlceForm,
	#superclass : #MOClass,
	#category : #'Moxing-Access-Declaration'
}

{ #category : #visiting }
MOAlceForm >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitForm: self
]

{ #category : #visiting }
MOAlceForm >> canBeReferredAsVariable [ 
	 ^ true
]

{ #category : #visiting }
MOAlceForm >> isWidget [ 
 	 ^ true 
]

{ #category : #visiting }
MOAlceForm >> object [

	^ (self model objectsSelect: [ :a | 
		   a type class = MOAlceForm and: [ a type name = name ] ]) first
]

{ #category : #visiting }
MOAlceForm >> symbolicName [

	^ self name copyFrom: 'Form_' size +1  to: name size
]
