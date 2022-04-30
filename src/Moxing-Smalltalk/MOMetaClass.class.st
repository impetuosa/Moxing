Class {
	#name : #MOMetaClass,
	#superclass : #MOClass,
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #visiting }
MOMetaClass >> acceptVisitor: aVisitor [
  ^aVisitor visitMetaClass: self
]
