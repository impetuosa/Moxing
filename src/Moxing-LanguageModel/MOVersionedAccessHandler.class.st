Class {
	#name : #MOVersionedAccessHandler,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Moxing-LanguageModel-Writting'
}

{ #category : #handling }
MOVersionedAccessHandler >> handleMessage: aMessage toTarget: anObject [

	aMessage selector = #isProxy ifTrue: [ ^ true ].
	model ifNil: [ ^ nil ].
	^ [ self proxify: (aMessage sendTo: (model entityFor: anObject)) ]
		  on: Error
		  do: [ :e | e ]
]

{ #category : #accessing }
MOVersionedAccessHandler >> model: aMOModelDerivative [ 
	model := aMOModelDerivative
]

{ #category : #handling }
MOVersionedAccessHandler >> proxify: anObject [

	^ anObject isProxy
		  ifTrue: [ anObject ]
		  ifFalse: [ 
			  anObject isMOObject
				  ifTrue: [ AvDelegationProxy target: anObject handler: self ]
				  ifFalse: [ anObject ] ]
]
