Class {
	#name : #MOTypescriptClass,
	#superclass : #MOClass,
	#instVars : [
		'#decorators => MOReferenceSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOTypescriptClass >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitTypescriptClass: self
]

{ #category : #accessing }
MOTypescriptClass >> decorators [
	^ decorators
]

{ #category : #accessing }
MOTypescriptClass >> decorators: aCollection [ 
	decorators := aCollection
]
