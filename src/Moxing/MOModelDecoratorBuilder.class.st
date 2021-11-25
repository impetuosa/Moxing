Class {
	#name : #MOModelDecoratorBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'properties'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> build [

	^ (self instantiate: MODecorator)
		  name: name;
		  attributes: self properties;
		  yourself
]

{ #category : #accessing }
MOModelDecoratorBuilder >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> properties [

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> property: aString value: aString2 [

	self properties at: aString put: aString2
]
