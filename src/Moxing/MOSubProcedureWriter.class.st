Class {
	#name : #MOSubProcedureWriter,
	#superclass : #MOConstructorWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOSubProcedureWriter >> initializeWriteBuilder [

	writeBuilder := builder procedureBuilder
]

{ #category : #writing }
MOSubProcedureWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #procedure / anEntity selector
]

{ #category : #writing }
MOSubProcedureWriter >> privateWriteToSurface: anEntity [

	surface addProcedure: anEntity.
	anEntity parent: surface.

]

{ #category : #writing }
MOSubProcedureWriter >> selector: aSelector [
 	writeBuilder selector: aSelector
]
