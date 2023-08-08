Class {
	#name : #MOModelResumeBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'destinations'
	],
	#category : #'Moxing-Access-MicroBuilder'
}

{ #category : #asserting }
MOModelResumeBuilder >> buildsType [

	^ MOAlceResume
]

{ #category : #accessing }
MOModelResumeBuilder >> destinations [ 
	 ^ destinations ifNil: [  destinations := OrderedCollection new  ]
]

{ #category : #accessing }
MOModelResumeBuilder >> destinations: aCollection [ 
	destinations := aCollection
]

{ #category : #accessing }
MOModelResumeBuilder >> privateBuild [

	^ destinations isEmptyOrNil
		  ifFalse: [ 
			  (self instantiate: MOAlceResumeLabel)
				  destinations: destinations;
				  yourself ]
		  ifTrue: [ (self instantiate: MOAlceResume) yourself ]
]
