Class {
	#name : #MOModelPhPragmaBuilder,
	#superclass : #MOModelGlobalVariableBuilder,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Moxing-StPharo-Model'
}

{ #category : #accessing }
MOModelPhPragmaBuilder >> arguments [

	^ arguments ifNil: [ arguments := OrderedCollection new ]
]

{ #category : #accessing }
MOModelPhPragmaBuilder >> arguments: aCollection [

	arguments := aCollection
]

{ #category : #asserting }
MOModelPhPragmaBuilder >> buildsType [ 
	^ MOStPragma
]

{ #category : #accessing }
MOModelPhPragmaBuilder >> loadBuilderWithEntity: anEntity [

	self selector: anEntity selector.
	self arguments: anEntity arguments
]

{ #category : #accessing }
MOModelPhPragmaBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  selector: self selector;
		  arguments: self arguments;
		  yourself
]

{ #category : #accessing }
MOModelPhPragmaBuilder >> selector [
	^ selector ifNil: [ self error: 'selector is not set' ]
]

{ #category : #accessing }
MOModelPhPragmaBuilder >> selector: aString [

	selector := aString
]
