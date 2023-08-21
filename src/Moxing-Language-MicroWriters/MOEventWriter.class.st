Class {
	#name : #MOEventWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #initialization }
MOEventWriter >> addParameter: aMOParameter [

	writeBuilder addParameter: aMOParameter
]

{ #category : #initialization }
MOEventWriter >> initializeWriteBuilder [

	writeBuilder := builder eventBuilder
]

{ #category : #initialization }
MOEventWriter >> parameters [
	^ writeBuilder parameters
]

{ #category : #initialization }
MOEventWriter >> privateWriteToSurface: anEntity [

	surface addEvent: anEntity
]

{ #category : #initialization }
MOEventWriter >> selector: aSelector [
 	writeBuilder selector: aSelector
]

{ #category : #writing }
MOEventWriter >> writeParameter: aBlock [
	<doc: 'Writes a parameter within a the context of an event.'>
	^ self write: aBlock inSubWriter: MOParameterWriter
]
