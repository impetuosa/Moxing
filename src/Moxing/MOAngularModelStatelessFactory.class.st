Class {
	#name : #MOAngularModelStatelessFactory,
	#superclass : #Object,
	#category : #Moxing
}

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularComponent [
	^ MOAngularProtoComponent new 
]

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularComponentBehaviorWriter [
	^ MOAngularComponentBehaviorWriter new 
]

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularComponentTemplateWriter [
	^ MOAngularComponentTemplateWriter new 
]
