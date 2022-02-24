"
I am just a regular variable slot.
I do represent the fact that my content does not lead to model instances but mostly to basic properties. Such as a name, anchor etc. 
"
Class {
	#name : #MOPropertySlot,
	#superclass : #InstanceVariableSlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MOPropertySlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure into: aWriter [

	^ aRule
		  applyOnProperty: aRelationObject
		  readingValues: aFullBlockClosure
		  into: aWriter
]

{ #category : #testing }
MOPropertySlot >> isToMany [
	^ false 
]
