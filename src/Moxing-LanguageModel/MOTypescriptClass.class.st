Class {
	#name : #MOTypescriptClass,
	#superclass : #MOClass,
	#instVars : [
		'#decorators => MOReferenceSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOTypescriptClass >> decorators: aCollection [ 
	decorators := aCollection
]
