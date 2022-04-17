Class {
	#name : #MOStModelMethodBuilder,
	#superclass : #MOModelMethodBuilder,
	#instVars : [
		'category'
	],
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #asserting }
MOStModelMethodBuilder >> buildsType [
  ^MOStMethod
]

{ #category : #asserting }
MOStModelMethodBuilder >> category [
  ^category
]

{ #category : #asserting }
MOStModelMethodBuilder >> category: aCat [
  category := aCat
]

{ #category : #asserting }
MOStModelMethodBuilder >> loadBuilderWithEntity: anEntity [ 
	super loadBuilderWithEntity: anEntity .
	self category: anEntity category 
]

{ #category : #asserting }
MOStModelMethodBuilder >> privateBuild [
  ^super privateBuild
     category: self category;
     yourself
]
