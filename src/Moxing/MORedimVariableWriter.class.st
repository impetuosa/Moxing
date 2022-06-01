Class {
	#name : #MORedimVariableWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MORedimVariableWriter >> initializeWriteBuilder [

	writeBuilder := builder redimVariableBuilder
]

{ #category : #initialization }
MORedimVariableWriter >> redimText: aText [
 	^ writeBuilder redimText: aText 
]

{ #category : #initialization }
MORedimVariableWriter >> reference: aReference [
 	^ writeBuilder reference: aReference 
]
