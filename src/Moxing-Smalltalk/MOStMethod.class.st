Class {
	#name : #MOStMethod,
	#superclass : #MOMethod,
	#instVars : [
		'#category => MOPropertySlot'
	],
	#category : #'Moxing-Smalltalk-Model'
}

{ #category : #accessing }
MOStMethod >> acceptVisitor: aVisitor [
  aVisitor visitStMethod: self
]

{ #category : #accessing }
MOStMethod >> category [
	^ category
]

{ #category : #accessing }
MOStMethod >> category: anUndefinedObject [ 
	category := anUndefinedObject
]

{ #category : #accessing }
MOStMethod >> isStaticBinding [

	^ super isStaticBinding
		  ifFalse: [ 
			  self parent
				  ifNotNil: [ :pa | pa isKindOf: MOMetaClass ]
				  ifNil: [ false ] ]
		  ifTrue: [ true ]
]
