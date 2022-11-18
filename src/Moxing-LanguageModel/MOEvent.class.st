Class {
	#name : #MOEvent,
	#superclass : #MODeclaration,
	#instVars : [
		'#selector => MOPropertySlot',
		'#parameters => MODeclaresSlot many'
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
