Class {
	#name : #MOAngularModelStatelessFactory,
	#superclass : #Object,
	#category : #'Moxing-Angular-Building'
}

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularComponent [
	^ MOAngularTransientComponent new 
]

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularComponentBehaviorWriter [
	^ MOAngularComponentBehaviorWriter new 
]

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularComponentTemplateWriter [
	^ MOAngularComponentTemplateWriter new 
]

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularModelComponentWriter [
	^ MOAngularModelWriter new 
]

{ #category : #'as yet unclassified' }
MOAngularModelStatelessFactory >> createNewAngularServiceComponentWriter [
	^ MOAngularServiceWriter new 
]
