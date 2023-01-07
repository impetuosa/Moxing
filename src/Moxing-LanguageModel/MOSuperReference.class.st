Class {
	#name : #MOSuperReference,
	#superclass : #MOSelfReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOSuperReference >> name [

	^ name ifNil: [ name := #super ]
]

{ #category : #accessing }
MOSuperReference >> printOn: aStream [ 
	aStream nextPutAll: 'REF SUPER'
]
