Class {
	#name : #MOMetaClass,
	#superclass : #MOClass,
	#category : #'Moxing-Smalltalk-Model'
}

{ #category : #visiting }
MOMetaClass >> acceptVisitor: aVisitor [
  ^aVisitor visitMetaClass: self
]

{ #category : #visiting }
MOMetaClass >> isStMetaclass [

	^ true
]
