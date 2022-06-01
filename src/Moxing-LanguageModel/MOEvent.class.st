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
MOEvent >> acceptVisitor: aMOElementToUIString [

	^ aMOElementToUIString visitEvent: self
]

{ #category : #accessing }
MOEvent >> canBeReferredAsFunction [
	 ^ true 
]

{ #category : #accessing }
MOEvent >> canBeReferredAsMethod [
	 ^ true 
]

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
