Class {
	#name : #MOEvent,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#selector => MOPropertySlot',
		'#parameters => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOEvent >> isInvocable [
	 ^ true 
]

{ #category : #accessing }
MOEvent >> parameters: aCollection [ 
	parameters := aCollection
]

{ #category : #accessing }
MOEvent >> selector: aString [ 
	selector := aString
]