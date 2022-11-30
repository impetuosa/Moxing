Class {
	#name : #MOStClass,
	#superclass : #MOClass,
	#instVars : [
		'#metaclass => MODeclaresSlot one',
		'#category => MOPropertySlot',
		'#comment => MOPropertySlot',
		'#isPreexisting => MOPropertySlot',
		'#sharedPools => MOExpressesSlot many'
	],
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #accessing }
MOStClass >> acceptVisitor: aVisitor [
  ^aVisitor visitStClass: self
]

{ #category : #accessing }
MOStClass >> category [
	^ category
]

{ #category : #accessing }
MOStClass >> category: aString [

	category := aString
]

{ #category : #accessing }
MOStClass >> comment [
	^ comment
]

{ #category : #accessing }
MOStClass >> comment: aComment [

	comment := aComment
]

{ #category : #accessing }
MOStClass >> instanceVariables [
  ^attributes reject: [:a |  a isSharedVariable ]
]

{ #category : #accessing }
MOStClass >> isPreexisting [
	 ^ isPreexisting ifNil: [ false  ]
]

{ #category : #accessing }
MOStClass >> isPreexisting: aBool [
  isPreexisting := aBool
]

{ #category : #accessing }
MOStClass >> metaclass [
	^ metaclass
]

{ #category : #accessing }
MOStClass >> metaclass: aMOMetaClass [ 
	metaclass := aMOMetaClass
]

{ #category : #accessing }
MOStClass >> sharedVariables [

	^ attributes select: [ :a | a isSharedVariable ]
]
