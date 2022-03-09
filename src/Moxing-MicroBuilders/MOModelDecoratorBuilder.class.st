"
I build typescript decorators 
"
Class {
	#name : #MOModelDecoratorBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'properties'
	],
	#category : #'Moxing-MicroBuilders-core'
}

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> buildsType [
<generated>
	^MODecorator
]

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> loadBuilderWithEntity: anEntity [ 
	self name: anEntity name. 
 self properties: anEntity attributes. 
 
	
]

{ #category : #accessing }
MOModelDecoratorBuilder >> name [

	^ name
]

{ #category : #accessing }
MOModelDecoratorBuilder >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> privateBuild [

	^ (self instantiate: MODecorator)
		  name: name;
		  attributes: self properties;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> properties [

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #accessing }
MOModelDecoratorBuilder >> properties: anObject [

	properties := anObject
]

{ #category : #'as yet unclassified' }
MOModelDecoratorBuilder >> property: aString value: aString2 [

	self properties at: aString put: aString2
]
