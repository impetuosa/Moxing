Class {
	#name : #MOCasinoToAngularModel,
	#superclass : #Object,
	#instVars : [
		'destination',
		'origin',
		'createdEntitites',
		'stack',
		'factory',
		'behaviorWriter'
	],
	#category : #Moxing
}

{ #category : #private }
MOCasinoToAngularModel class >> loadFrom: aJinCasinoPartialModelCreator [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOCasinoToAngularModel class >> loadFrom: aJinCasinoPartialModelCreator into: aJinAngularModule [ 
	| visitor | 
	visitor := self new.
	visitor destination: aJinAngularModule.
	visitor origin: aJinCasinoPartialModelCreator. 
	^ visitor calculateAngularModel. 
]

{ #category : #'as yet unclassified' }
MOCasinoToAngularModel >> calculateAngularModel [

	createdEntitites := Set new.
	origin model accept: self.
	destination components addAll: createdEntitites.
	createdEntitites do: [ : c | c module: destination  ]
]

{ #category : #'as yet unclassified' }
MOCasinoToAngularModel >> createdEntities [
	^ createdEntitites 
]

{ #category : #accessing }
MOCasinoToAngularModel >> destination: aJinAngularModule [ 
	destination := aJinAngularModule
]

{ #category : #accessing }
MOCasinoToAngularModel >> factory [
	^ factory ifNil: [ factory := MOAngularModelStatelessFactory new ]
]

{ #category : #accessing }
MOCasinoToAngularModel >> origin: aJinCasinoPartialModelCreator [ 
	origin := aJinCasinoPartialModelCreator
]

{ #category : #visiting }
MOCasinoToAngularModel >> visitCSNPage: aJinCasinoPage [ 
	| component templateWriter |
	component := self factory createNewAngularComponent.
	component name: aJinCasinoPage name.
	createdEntitites add: component. 
	templateWriter := self factory createNewAngularComponentTemplateWriter.  
	templateWriter writeHtmlFor: aJinCasinoPage into: component.  
	
	behaviorWriter := self factory createNewAngularComponentBehaviorWriter. 
	behaviorWriter writeBehaviorFor: aJinCasinoPage into: component. 
	
	
]

{ #category : #visiting }
MOCasinoToAngularModel >> visitMooseModel: aCSNUICWModel [

	origin firstClassCitizenMooseModels do: [ :fc | fc accept: self ].
 
]
