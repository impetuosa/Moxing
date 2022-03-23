Class {
	#name : #MOModelToModelTransform,
	#superclass : #Object,
	#instVars : [
		'subject'
	],
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOModelToModelTransform class >> transformationFor: aMOReturn [

	^ self new
		  subject: aMOReturn;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelToModelTransform >> lookUpForOwningMethod: aMOExit [

	^ self lookUpFrom: aMOExit for: MOInvocable
]

{ #category : #'as yet unclassified' }
MOModelToModelTransform >> lookUpFrom: aMOExit for: aClass [

	| current |
	current := aMOExit.
	[ current isKindOf: aClass ] whileFalse: [ 
		current := current parent ].
	^ current
]

{ #category : #accessing }
MOModelToModelTransform >> subject: aMOReturn [

	subject := aMOReturn
]
