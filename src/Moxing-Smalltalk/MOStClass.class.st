Class {
	#name : #MOStClass,
	#superclass : #MOClass,
	#instVars : [
		'#metaclass => MOContainmentSlot one',
		'#category => MOPropertySlot',
		'#comment => MOPropertySlot'
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
MOStClass >> comment: aComment [

	comment := aComment
]

{ #category : #accessing }
MOStClass >> metaclass [
	^ metaclass
]

{ #category : #accessing }
MOStClass >> metaclass: aMOMetaClass [ 
	metaclass := aMOMetaClass
]