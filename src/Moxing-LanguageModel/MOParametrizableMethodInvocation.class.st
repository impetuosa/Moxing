Class {
	#name : #MOParametrizableMethodInvocation,
	#superclass : #MOMethodInvocation,
	#instVars : [
		'#argumentTypeReferences => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOParametrizableMethodInvocation >> argumentTypeReferences [
	^ argumentTypeReferences
]

{ #category : #accessing }
MOParametrizableMethodInvocation >> argumentTypeReferences: aCollection [

	argumentTypeReferences := aCollection
]
