Class {
	#name : #MOModelStClassBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'metaclass',
		'category',
		'sharedVariables',
		'comment',
		'isPreexisting'
	],
	#category : #'Moxing-Smalltalk-builer'
}

{ #category : #asserting }
MOModelStClassBuilder >> buildsType [

	^ MOStClass
]

{ #category : #accessing }
MOModelStClassBuilder >> category [
	^ category
]

{ #category : #accessing }
MOModelStClassBuilder >> category: aString [

	category := aString
]

{ #category : #asserting }
MOModelStClassBuilder >> comment [ 
	^ comment ifNil: [ 'no comment' ]
]

{ #category : #asserting }
MOModelStClassBuilder >> comment: aComment [

	comment := aComment
]

{ #category : #accessing }
MOModelStClassBuilder >> isPreexisting [

	^ isPreexisting
]

{ #category : #testing }
MOModelStClassBuilder >> isPreexisting: anUndefinedObject [
  isPreexisting := anUndefinedObject
]

{ #category : #asserting }
MOModelStClassBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self metaclass: anEntity metaclass.
	self category: anEntity category.
	self comment: anEntity comment. 
	self isPreexisting: anEntity isPreexisting. 
]

{ #category : #asserting }
MOModelStClassBuilder >> metaclass [

	^ metaclass 
]

{ #category : #asserting }
MOModelStClassBuilder >> metaclass: aMetaClass [

	metaclass := aMetaClass
]

{ #category : #asserting }
MOModelStClassBuilder >> privateBuild [

	^ super privateBuild
		  metaclass: self metaclass;
		  category: self category;
		  comment: self comment;
		isPreexisting: self isPreexisting
		  yourself
]
